#include "../include/performance.h"
#include "../include/storage.h"
#include "../include/query.h"
#include "../include/data_generator.h"
#include <time.h>
#include <stdlib.h>
#include <string.h>

/**
 * @brief 打印性能测试分隔标题。
 * @param title 要显示的标题文本。
 */
static void print_separator(const char* title) {
    printf("\n===== %s =====\n", title);
}

/**
 * @brief 加载指定 CSV 文件到给定容器。
 * @param path CSV 文件路径。
 * @param container 目标数据容器。
 * @param iface 数据结构接口。
 */
static void load_file(const char* path, DataContainer* container, const DataInterface* iface) {
    if (!container || !iface || !path) return;
    load_from_csv(container, path, iface);
}

static double measure_load_time(const char* path, DataContainer* container, const DataInterface* iface) {
    clock_t start = clock();
    load_file(path, container, iface);
    clock_t end = clock();
    return ((double)(end - start)) / CLOCKS_PER_SEC;
}

static double measure_traverse_time(const DataContainer* container, const DataInterface* iface) {
    if (!container || !iface) return 0.0;
    int total = 0;
    clock_t start = clock();
    Record** records = iface->get_all_records((DataContainer*)container, &total);
    if (records) {
        for (int i = 0; i < total; ++i) free(records[i]);
        free(records);
    }
    clock_t end = clock();
    return ((double)(end - start)) / CLOCKS_PER_SEC;
}

static double measure_sort_time(const DataContainer* container, const DataInterface* iface) {
    if (!container || !iface) return 0.0;
    int total = 0;
    Record** records = iface->get_all_records((DataContainer*)container, &total);
    if (!records || total <= 0) {
        free(records);
        return 0.0;
    }

    const char* keys[] = {"score", "student_id"};
    bool orders[] = {false, true};
    clock_t start = clock();
    multi_key_sort(records, total, keys, orders, 2);
    clock_t end = clock();

    for (int i = 0; i < total; ++i) free(records[i]);
    free(records);
    return ((double)(end - start)) / CLOCKS_PER_SEC;
}

static double measure_find_time(const DataContainer* container, const DataInterface* iface, Record** samples, int sample_count) {
    if (!container || !iface || !samples || sample_count <= 0) return 0.0;
    clock_t start = clock();
    for (int i = 0; i < sample_count; ++i) {
        Record* result = iface->find((DataContainer*)container, samples[i]->student_id, samples[i]->course_id);
        if (result) free(result);
    }
    clock_t end = clock();
    return ((double)(end - start)) / CLOCKS_PER_SEC;
}

static double measure_delete_time(const char* path, const DataInterface* iface, Record** samples, int sample_count) {
    if (!path || !iface || !samples || sample_count <= 0) return 0.0;
    DataContainer* container = iface->create();
    if (!container) return 0.0;
    load_from_csv(container, path, iface);

    clock_t start = clock();
    for (int i = 0; i < sample_count; ++i) {
        iface->delete(container, samples[i]->student_id, samples[i]->course_id);
    }
    clock_t end = clock();

    iface->destroy(container);
    return ((double)(end - start)) / CLOCKS_PER_SEC;
}

static void print_record_count(const DataContainer* container, const DataInterface* iface) {
    if (!container || !iface) return;
    printf("当前记录数：%d\n", iface->count((DataContainer*)container));
}

static int safe_file_exists(const char* path) {
    FILE* file = fopen(path, "r");
    if (!file) return 0;
    fclose(file);
    return 1;
}

static int get_expected_count_for_path(const char* path) {
    if (!path) return 0;
    if (strstr(path, "100000") != NULL) return 100000;
    if (strstr(path, "10000") != NULL) return 10000;
    if (strstr(path, "1000") != NULL) return 1000;
    if (strstr(path, "100") != NULL) return 100;
    return 0;
}

static bool ensure_test_file(const char* path) {
    if (safe_file_exists(path)) return true;

    int expected_count = get_expected_count_for_path(path);
    if (expected_count <= 0) {
        printf("跳过不存在文件：%s\n", path);
        return false;
    }

    printf("文件不存在，正在生成 %d 条测试数据到 %s...\n", expected_count, path);
    return generate_csv(expected_count, path);
}

void run_performance_comparison(const char* files[]) {
    if (!files) return;

    for (int i = 0; i < 4; ++i) {
        if (!ensure_test_file(files[i])) {
            continue;
        }

        DataContainer* list_container = get_list_interface()->create();
        DataContainer* hash_container = get_hash_interface()->create();
        if (!list_container || !hash_container) {
            printf("创建容器失败。\n");
            if (list_container) get_list_interface()->destroy(list_container);
            if (hash_container) get_hash_interface()->destroy(hash_container);
            return;
        }

        double list_load = measure_load_time(files[i], list_container, get_list_interface());
        double hash_load = measure_load_time(files[i], hash_container, get_hash_interface());
        double list_traverse = measure_traverse_time(list_container, get_list_interface());
        double hash_traverse = measure_traverse_time(hash_container, get_hash_interface());
        double list_sort = measure_sort_time(list_container, get_list_interface());
        double hash_sort = measure_sort_time(hash_container, get_hash_interface());

        int total = 0;
        Record** sample_records = get_list_interface()->get_all_records(list_container, &total);
        int sample_count = total > 20 ? 20 : total;
        double list_find = measure_find_time(list_container, get_list_interface(), sample_records, sample_count);
        double hash_find = measure_find_time(hash_container, get_hash_interface(), sample_records, sample_count);
        double list_delete = measure_delete_time(files[i], get_list_interface(), sample_records, sample_count);
        double hash_delete = measure_delete_time(files[i], get_hash_interface(), sample_records, sample_count);

        print_separator(files[i]);
        printf("结构    操作       耗时(s)\n");
        printf("链表    加载       %.6f\n", list_load);
        printf("链表    遍历       %.6f\n", list_traverse);
        printf("链表    排序       %.6f\n", list_sort);
        printf("链表    查找(%d)  %.6f\n", sample_count, list_find);
        printf("链表    删除(%d)  %.6f\n", sample_count, list_delete);
        printf("哈希    加载       %.6f\n", hash_load);
        printf("哈希    遍历       %.6f\n", hash_traverse);
        printf("哈希    排序       %.6f\n", hash_sort);
        printf("哈希    查找(%d)  %.6f\n", sample_count, hash_find);
        printf("哈希    删除(%d)  %.6f\n", sample_count, hash_delete);
        print_record_count(list_container, get_list_interface());

        for (int j = 0; j < total; ++j) free(sample_records[j]);
        free(sample_records);
        get_list_interface()->destroy(list_container);
        get_hash_interface()->destroy(hash_container);
    }
}

static int find_group_index(const char* key, const char** groups, int group_count) {
    /* 在已记录的分组名称中查找指定 key 的索引 */
    for (int i = 0; i < group_count; ++i) {
        if (strcmp(groups[i], key) == 0) return i;
    }
    return -1;
}

void stat_course_enrollment(const DataContainer* container, const DataInterface* iface, int capacity) {
    if (!container || !iface) return;
    int total = 0;
    Record** records = iface->get_all_records((DataContainer*)container, &total);
    if (!records || total <= 0) {
        printf("没有可统计的数据。\n");
        free(records);
        return;
    }

    /* 使用动态数组构造课程统计信息 */
    char** course_ids = (char**)calloc(total, sizeof(char*));
    int* counts = (int*)calloc(total, sizeof(int));
    int course_count = 0;
    if (!course_ids || !counts) {
        printf("内存不足，无法统计。\n");
        free(course_ids);
        free(counts);
        for (int i = 0; i < total; ++i) free(records[i]);
        free(records);
        return;
    }

    for (int i = 0; i < total; ++i) {
        int idx = find_group_index(records[i]->course_id, (const char**)course_ids, course_count);
        if (idx < 0) {
            course_ids[course_count] = strdup(records[i]->course_id);
            counts[course_count] = 1;
            course_count++;
        } else {
            counts[idx]++;
        }
    }

    printf("课程选课人数与容量使用率（容量：%d）\n", capacity);
    for (int i = 0; i < course_count; ++i) {
        float rate = capacity > 0 ? (counts[i] * 100.0f / capacity) : 0.0f;
        printf("%s - %d 人，使用率 %.2f%%\n", course_ids[i], counts[i], rate);
        free(course_ids[i]);
    }

    free(course_ids);
    free(counts);
    for (int i = 0; i < total; ++i) free(records[i]);
    free(records);
}

void stat_student_credits(const DataContainer* container, const DataInterface* iface) {
    if (!container || !iface) return;
    int total = 0;
    Record** records = iface->get_all_records((DataContainer*)container, &total);
    if (!records || total <= 0) {
        printf("没有可统计的数据。\n");
        free(records);
        return;
    }

    /* 汇总每个学生的学分和选课门数 */
    char** student_ids = (char**)calloc(total, sizeof(char*));
    float* credits = (float*)calloc(total, sizeof(float));
    int* course_counts = (int*)calloc(total, sizeof(int));
    int student_count = 0;
    if (!student_ids || !credits || !course_counts) {
        printf("内存不足，无法统计。\n");
        free(student_ids);
        free(credits);
        free(course_counts);
        for (int i = 0; i < total; ++i) free(records[i]);
        free(records);
        return;
    }

    for (int i = 0; i < total; ++i) {
        int idx = find_group_index(records[i]->student_id, (const char**)student_ids, student_count);
        if (idx < 0) {
            student_ids[student_count] = strdup(records[i]->student_id);
            credits[student_count] = records[i]->credit;
            course_counts[student_count] = 1;
            student_count++;
        } else {
            credits[idx] += records[i]->credit;
            course_counts[idx]++;
        }
    }

    printf("每位学生选课门数与总学分\n");
    for (int i = 0; i < student_count; ++i) {
        printf("%s - %d 门，%.1f 学分\n", student_ids[i], course_counts[i], credits[i]);
        free(student_ids[i]);
    }

    free(student_ids);
    free(credits);
    free(course_counts);
    for (int i = 0; i < total; ++i) free(records[i]);
    free(records);
}

void stat_college_distribution(const DataContainer* container, const DataInterface* iface) {
    if (!container || !iface) return;
    int total = 0;
    Record** records = iface->get_all_records((DataContainer*)container, &total);
    if (!records || total <= 0) {
        printf("没有可统计的数据。\n");
        free(records);
        return;
    }

    /* 统计每个学院出现的次数 */
    char** colleges = (char**)calloc(total, sizeof(char*));
    int* counts = (int*)calloc(total, sizeof(int));
    int college_count = 0;
    if (!colleges || !counts) {
        printf("内存不足，无法统计。\n");
        free(colleges);
        free(counts);
        for (int i = 0; i < total; ++i) free(records[i]);
        free(records);
        return;
    }

    for (int i = 0; i < total; ++i) {
        int idx = find_group_index(records[i]->college, (const char**)colleges, college_count);
        if (idx < 0) {
            colleges[college_count] = strdup(records[i]->college);
            counts[college_count] = 1;
            college_count++;
        } else {
            counts[idx]++;
        }
    }

    printf("各学院选课人数分布\n");
    for (int i = 0; i < college_count; ++i) {
        printf("%s - %d 人\n", colleges[i], counts[i]);
        free(colleges[i]);
    }

    free(colleges);
    free(counts);
    for (int i = 0; i < total; ++i) free(records[i]);
    free(records);
}

void stat_semester_trend(const DataContainer* container, const DataInterface* iface) {
    if (!container || !iface) return;
    int total = 0;
    Record** records = iface->get_all_records((DataContainer*)container, &total);
    if (!records || total <= 0) {
        printf("没有可统计的数据。\n");
        free(records);
        return;
    }

    /* 按学期汇总选课记录数量 */
    char** semesters = (char**)calloc(total, sizeof(char*));
    int* student_counts = (int*)calloc(total, sizeof(int));
    int* course_counts = (int*)calloc(total, sizeof(int));
    int semester_count = 0;
    if (!semesters || !student_counts || !course_counts) {
        printf("内存不足，无法统计。\n");
        free(semesters);
        free(student_counts);
        free(course_counts);
        for (int i = 0; i < total; ++i) free(records[i]);
        free(records);
        return;
    }

    for (int i = 0; i < total; ++i) {
        int idx = find_group_index(records[i]->semester, (const char**)semesters, semester_count);
        if (idx < 0) {
            semesters[semester_count] = strdup(records[i]->semester);
            student_counts[semester_count] = 1;
            course_counts[semester_count] = 1;
            semester_count++;
        } else {
            student_counts[idx]++;
            course_counts[idx]++;
        }
    }

    printf("按学期统计选课总人数与课程数\n");
    for (int i = 0; i < semester_count; ++i) {
        printf("%s - %d 条记录，%d 次选课\n", semesters[i], student_counts[i], course_counts[i]);
        free(semesters[i]);
    }

    free(semesters);
    free(student_counts);
    free(course_counts);
    for (int i = 0; i < total; ++i) free(records[i]);
    free(records);
}

void stat_score_distribution(const DataContainer* container, const DataInterface* iface) {
    if (!container || !iface) return;
    int total = 0;
    Record** records = iface->get_all_records((DataContainer*)container, &total);
    if (!records || total <= 0) {
        printf("没有可统计的数据。\n");
        free(records);
        return;
    }

    /* 将成绩按照区间分桶统计 */
    int buckets[5] = {0};
    for (int i = 0; i < total; ++i) {
        int score = records[i]->score;
        if (score < 60) {
            buckets[0]++;
        } else if (score < 70) {
            buckets[1]++;
        } else if (score < 80) {
            buckets[2]++;
        } else if (score < 90) {
            buckets[3]++;
        } else {
            buckets[4]++;
        }
    }

    printf("课程成绩分布统计\n");
    printf("0-59: %d 人\n", buckets[0]);
    printf("60-69: %d 人\n", buckets[1]);
    printf("70-79: %d 人\n", buckets[2]);
    printf("80-89: %d 人\n", buckets[3]);
    printf("90-100: %d 人\n", buckets[4]);

    for (int i = 0; i < total; ++i) free(records[i]);
    free(records);
}
