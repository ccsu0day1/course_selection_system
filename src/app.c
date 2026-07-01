/**
 * @file app.c
 * @brief 应用程序主业务逻辑模块。
 * @details 该文件封装主菜单、命令处理和高层业务函数，减少 main.c 的实现复杂度。
 */

#include "../include/common.h"
#include "../include/storage.h"
#include "../include/query.h"
#include "../include/performance.h"
#include "../include/app.h"

/*==================== 全局状态变量 ====================*/
static DataContainer* g_container = NULL;
static const DataInterface* g_iface = NULL;
static char g_current_file[256] = "data/records.csv";

/*==================== 前向声明 ====================*/
static void select_data_structure(void);
static void load_data(void);
static void save_data(void);
static void insert_record(void);
static void delete_record(void);
static void find_record(void);
static void filter_and_sort(void);
static void delete_expired(void);
static void statistics_menu(void);
static void performance_menu(void);
static void generate_data_menu(void);

static void display_main_menu(void);

void run_app(void) {
    int choice;

    printf("\n========================================\n");
    printf("  校园选课记录检索与分析系统\n");
    printf("  数据结构与算法课程设计\n");
    printf("========================================\n");

    while (1) {
        display_main_menu();
        scanf("%d", &choice);
        getchar();

        switch (choice) {
            case 1: select_data_structure(); break;
            case 2: load_data(); break;
            case 3: save_data(); break;
            case 4: insert_record(); break;
            case 5: delete_record(); break;
            case 6: find_record(); break;
            case 7: filter_and_sort(); break;
            case 8: statistics_menu(); break;
            case 9: delete_expired(); break;
            case 10: performance_menu(); break;
            case 11: generate_data_menu(); break;
            case 0:
                if (g_container && g_iface) {
                    g_iface->destroy(g_container);
                }
                printf("感谢使用，再见！\n");
                return;
            default:
                printf("无效选项，请重新输入。\n");
        }
    }
}

static void display_main_menu(void) {
    printf("\n========== 主菜单 ==========\n");
    printf("1. 选择数据结构（链表/哈希表）\n");
    printf("2. 加载数据（CSV）\n");
    printf("3. 保存数据\n");
    printf("4. 插入记录\n");
    printf("5. 删除记录\n");
    printf("6. 查找记录\n");
    printf("7. 筛选与排序\n");
    printf("8. 统计分析\n");
    printf("9. 批量删除过期记录\n");
    printf("10. 性能对比测试\n");
    printf("11. 生成测试数据\n");
    printf("0. 退出\n");
    printf("请输入选项：");
}

static void generate_data_menu(void) {
    printf("\n===== 生成测试数据 =====\n");
    printf("1. 生成 100 条 (data/generated_100.csv)\n");
    printf("2. 生成 1000 条 (data/generated_1000.csv)\n");
    printf("3. 生成 10000 条 (data/generated_10000.csv)\n");
    printf("4. 自定义数量\n");
    printf("请选择：");
    int choice = 0;
    scanf("%d", &choice);
    getchar();

    int count = 0;
    const char* path = NULL;
    char custom_path[256];

    switch (choice) {
        case 1: count = 100; path = "data/generated_100.csv"; break;
        case 2: count = 1000; path = "data/generated_1000.csv"; break;
        case 3: count = 10000; path = "data/generated_10000.csv"; break;
        case 4:
            printf("请输入生成数量：");
            scanf("%d", &count);
            getchar();
            printf("请输入输出文件路径（回车使用 data/generated_custom.csv）：");
            fgets(custom_path, sizeof(custom_path), stdin);
            custom_path[strcspn(custom_path, "\n")] = '\0';
            if (strlen(custom_path) == 0) strcpy(custom_path, "data/generated_custom.csv");
            path = custom_path;
            break;
        default:
            printf("无效选择。\n");
            return;
    }

    if (count <= 0) {
        printf("数量必须大于 0。\n");
        return;
    }

    extern bool generate_csv(int, const char*);
    if (generate_csv(count, path)) {
        printf("已生成 %d 条记录到 %s\n", count, path);
    } else {
        printf("生成失败，请检查路径和权限。\n");
    }
}

static void select_data_structure(void) {
    int choice;
    printf("\n请选择数据结构：\n");
    printf("1. 双向链表\n");
    printf("2. 哈希表\n");
    printf("请输入数字：");
    scanf("%d", &choice);
    getchar();

    if (g_container && g_iface) {
        g_iface->destroy(g_container);
        g_container = NULL;
        g_iface = NULL;
    }

    if (choice == 1) {
        g_iface = get_list_interface();
        printf("已选择双向链表。\n");
    } else if (choice == 2) {
        g_iface = get_hash_interface();
        printf("已选择哈希表。\n");
    } else {
        printf("无效选择，请重新选择。\n");
        return;
    }

    g_container = g_iface->create();
    if (g_container) {
        printf("容器创建成功。\n");
    } else {
        printf("容器创建失败，请检查内存。\n");
        g_iface = NULL;
    }
}

static void load_data(void) {
    if (!g_container || !g_iface) {
        printf("请先选择数据结构！\n");
        return;
    }

    printf("输入文件名（直接回车使用默认 data/records.csv）：");
    char input[256];
    fgets(input, sizeof(input), stdin);
    input[strcspn(input, "\n")] = '\0';

    if (strlen(input) > 0) {
        strcpy(g_current_file, input);
    }

    if (g_container && g_iface) {
        g_iface->destroy(g_container);
        g_container = g_iface->create();
        if (!g_container) {
            printf("容器重建失败，请检查内存。\n");
            g_iface = NULL;
            return;
        }
    }

    int loaded = load_from_csv(g_container, g_current_file, g_iface);
    if (loaded >= 0) {
        printf("成功加载 %d 条记录。\n", loaded);
    } else {
        printf("加载失败，请检查文件路径和格式。\n");
    }
}

static void save_data(void) {
    if (!g_container || !g_iface) {
        printf("请先选择数据结构并加载数据！\n");
        return;
    }

    int saved = save_to_csv(g_container, g_current_file, g_iface);
    if (saved >= 0) {
        printf("成功保存 %d 条记录到 %s。\n", saved, g_current_file);
    } else {
        printf("保存失败，请检查文件权限或磁盘空间。\n");
    }
}

static void insert_record(void) {
    if (!g_container || !g_iface) {
        printf("请先选择数据结构！\n");
        return;
    }

    Record rec;
    memset(&rec, 0, sizeof(rec));
    printf("请输入学号（12位）：");
    scanf("%15s", rec.student_id);
    printf("请输入姓名：");
    scanf("%63s", rec.name);
    printf("请输入学院：");
    scanf("%63s", rec.college);
    printf("请输入课程编号（8位）：");
    scanf("%15s", rec.course_id);
    printf("请输入课程名称：");
    scanf("%63s", rec.course_name);
    printf("请输入学分（如 3.5）：");
    scanf("%f", &rec.credit);
    printf("请输入选课学期（如 2024-02）：");
    scanf("%15s", rec.semester);
    printf("请输入选课日期（YYYY-MM-DD）：");
    scanf("%15s", rec.date);
    printf("请输入成绩（0-100）：");
    scanf("%d", &rec.score);
    getchar();

    if (g_iface->insert(g_container, &rec)) {
        printf("插入成功。\n");
    } else {
        printf("插入失败（可能记录已存在或内存不足）。\n");
    }
}

static void delete_record(void) {
    if (!g_container || !g_iface) {
        printf("请先选择数据结构并加载数据！\n");
        return;
    }

    char sid[MAX_ID_LEN];
    char cid[MAX_COURSE_ID_LEN];
    printf("请输入学号：");
    scanf("%15s", sid);
    printf("请输入课程编号：");
    scanf("%15s", cid);
    getchar();

    if (g_iface->delete(g_container, sid, cid)) {
        printf("删除成功。\n");
    } else {
        printf("未找到该记录。\n");
    }
}

static void find_record(void) {
    if (!g_container || !g_iface) {
        printf("请先选择数据结构并加载数据！\n");
        return;
    }

    char sid[MAX_ID_LEN];
    char cid[MAX_COURSE_ID_LEN];
    printf("请输入学号：");
    scanf("%15s", sid);
    printf("请输入课程编号：");
    scanf("%15s", cid);
    getchar();

    Record* rec = g_iface->find(g_container, sid, cid);
    if (rec) {
        printf("\n========== 找到记录 ==========\n");
        printf("学号：%s\n", rec->student_id);
        printf("姓名：%s\n", rec->name);
        printf("学院：%s\n", rec->college);
        printf("课程编号：%s\n", rec->course_id);
        printf("课程名称：%s\n", rec->course_name);
        printf("学分：%.1f\n", rec->credit);
        printf("学期：%s\n", rec->semester);
        printf("日期：%s\n", rec->date);
        printf("成绩：%d\n", rec->score);
        printf("==============================\n");
        free(rec);
    } else {
        printf("未找到该记录。\n");
    }
}

static bool validate_sort_key(const char* key) {
    const char* valid_keys[] = {"score", "student_id", "course_id", "name", "course_name", "college", "semester", "credit"};
    for (int i = 0; i < (int)(sizeof(valid_keys) / sizeof(valid_keys[0])); ++i) {
        if (strcmp(key, valid_keys[i]) == 0) {
            return true;
        }
    }
    return false;
}

static void filter_and_sort(void) {
    if (!g_container || !g_iface) {
        printf("请先选择数据结构并加载数据！\n");
        return;
    }

    FilterCriteria criteria = {{0}};
    printf("\n===== 筛选条件（直接回车表示不限制） =====\n");
    printf("学号（精确匹配）：");
    fgets(criteria.student_id, sizeof(criteria.student_id), stdin);
    criteria.student_id[strcspn(criteria.student_id, "\n")] = '\0';

    printf("姓名（模糊匹配）：");
    fgets(criteria.name, sizeof(criteria.name), stdin);
    criteria.name[strcspn(criteria.name, "\n")] = '\0';

    printf("课程名称（模糊匹配）：");
    fgets(criteria.course_name, sizeof(criteria.course_name), stdin);
    criteria.course_name[strcspn(criteria.course_name, "\n")] = '\0';

    printf("学期（精确匹配，如 2024-02）：");
    fgets(criteria.semester, sizeof(criteria.semester), stdin);
    criteria.semester[strcspn(criteria.semester, "\n")] = '\0';

    printf("成绩下限（-1 表示不限制）：");
    scanf("%d", &criteria.score_min);
    printf("成绩上限（-1 表示不限制）：");
    scanf("%d", &criteria.score_max);
    getchar();

    printf("学院（精确匹配）：");
    fgets(criteria.college, sizeof(criteria.college), stdin);
    criteria.college[strcspn(criteria.college, "\n")] = '\0';

    int count = 0;
    Record** results = filter_records(g_container, g_iface, &criteria, &count);
    if (!results || count == 0) {
        printf("没有匹配的记录。\n");
        if (results) free(results);
        return;
    }

    const char* default_keys[] = {"score", "student_id"};
    bool default_orders[] = {false, true};
    const char* sort_keys[3] = {NULL, NULL, NULL};
    bool sort_orders[3] = {true, true, true};
    int sort_count = 0;

    char answer[8];
    printf("是否自定义排序字段？(y/n)：");
    fgets(answer, sizeof(answer), stdin);
    if (answer[0] == 'y' || answer[0] == 'Y') {
        for (int i = 0; i < 3; ++i) {
            char key[32];
            printf("请输入第 %d 个排序字段（score/student_id/course_id/name/course_name/college/semester/credit，回车结束）：", i + 1);
            fgets(key, sizeof(key), stdin);
            key[strcspn(key, "\n")] = '\0';
            if (key[0] == '\0') break;
            if (!validate_sort_key(key)) {
                printf("无效字段：%s，已忽略。\n", key);
                continue;
            }
            sort_keys[sort_count] = strdup(key);
            char order[8];
            printf("%s 排序方向 (asc/desc)：", key);
            fgets(order, sizeof(order), stdin);
            order[strcspn(order, "\n")] = '\0';
            sort_orders[sort_count] = (strcmp(order, "desc") != 0);
            sort_count++;
        }
    }

    if (sort_count == 0) {
        sort_count = 2;
        sort_keys[0] = default_keys[0];
        sort_orders[0] = default_orders[0];
        sort_keys[1] = default_keys[1];
        sort_orders[1] = default_orders[1];
    }

    multi_key_sort(results, count, sort_keys, sort_orders, sort_count);

    printf("\n===== 筛选排序结果（共 %d 条） =====\n", count);
    int show = (count < 20) ? count : 20;
    for (int i = 0; i < show; ++i) {
        Record* r = results[i];
        printf("%d. %s %s %s %s %.1f %d\n",
               i + 1, r->student_id, r->name, r->course_name,
               r->semester, r->credit, r->score);
    }
    if (count > 20) printf("...（仅显示前20条）\n");

    char choice[10];
    printf("\n是否导出到文件？(y/n)：");
    fgets(choice, sizeof(choice), stdin);
    if (choice[0] == 'y' || choice[0] == 'Y') {
        char fname[256];
        printf("请输入文件名（如 output.csv）：");
        fgets(fname, sizeof(fname), stdin);
        fname[strcspn(fname, "\n")] = '\0';
        if (strlen(fname) > 0) {
            if (export_to_csv(results, count, fname)) {
                printf("成功导出到 %s\n", fname);
            } else {
                printf("导出失败。\n");
            }
        }
    }

    for (int i = 0; i < sort_count; ++i) {
        if (sort_keys[i] && sort_keys[i] != default_keys[0] && sort_keys[i] != default_keys[1]) {
            free((void*)sort_keys[i]);
        }
    }
    for (int i = 0; i < count; ++i) free(results[i]);
    free(results);
}

static void delete_expired(void) {
    if (!g_container || !g_iface) {
        printf("请先选择数据结构并加载数据！\n");
        return;
    }

    const char* cutoff_date = "2023-09-01";
    int total = 0;
    Record** all = g_iface->get_all_records(g_container, &total);
    if (!all || total == 0) {
        printf("没有记录可操作。\n");
        if (all) free(all);
        return;
    }

    int to_delete = 0;
    for (int i = 0; i < total; ++i) {
        if (strcmp(all[i]->date, cutoff_date) < 0) {
            to_delete++;
        }
    }

    if (to_delete == 0) {
        printf("没有过期记录需要删除（基准日期：2023-09-01）。\n");
        for (int i = 0; i < total; ++i) free(all[i]);
        free(all);
        return;
    }

    printf("找到 %d 条过期记录（选课日期早于 2023-09-01），确认删除？(y/n)：", to_delete);
    char confirm;
    scanf("%c", &confirm);
    getchar();

    if (confirm == 'y' || confirm == 'Y') {
        int deleted = 0;
        for (int i = 0; i < total; ++i) {
            if (strcmp(all[i]->date, cutoff_date) < 0) {
                if (g_iface->delete(g_container, all[i]->student_id, all[i]->course_id)) {
                    deleted++;
                }
            }
            free(all[i]);
        }
        printf("成功删除 %d 条过期记录。\n", deleted);
    } else {
        for (int i = 0; i < total; ++i) free(all[i]);
        printf("操作已取消。\n");
    }
    free(all);
}

static void statistics_menu(void) {
    if (!g_container || !g_iface) {
        printf("请先选择数据结构并加载数据！\n");
        return;
    }

    int choice;
    printf("\n===== 统计分析 =====\n");
    printf("1. 每门课程选课人数与容量使用率\n");
    printf("2. 每位学生选课门数与总学分\n");
    printf("3. 各学院选课人数分布\n");
    printf("4. 按学期统计选课总人数与课程数\n");
    printf("5. 课程成绩分布统计\n");
    printf("请输入选择：");
    scanf("%d", &choice);
    getchar();

    switch (choice) {
        case 1: stat_course_enrollment(g_container, g_iface, 50); break;
        case 2: stat_student_credits(g_container, g_iface); break;
        case 3: stat_college_distribution(g_container, g_iface); break;
        case 4: stat_semester_trend(g_container, g_iface); break;
        case 5: stat_score_distribution(g_container, g_iface); break;
        default: printf("无效选项。\n");
    }
}

static void performance_menu(void) {
    const char* files[3] = {
        "data/generated_100.csv",
        "data/generated_1000.csv",
        "data/generated_10000.csv"
    };
    run_performance_comparison(files);
}
