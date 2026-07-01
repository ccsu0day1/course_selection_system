#include "../include/query.h"

/**
 * @brief 判断记录是否满足筛选条件。
 * @param record 待判断的记录。
 * @param criteria 筛选条件。
 * @return 满足返回 true，否则返回 false。
 */
static bool record_matches(const Record* record, const FilterCriteria* criteria) {
    if (!record || !criteria) return false;

    if (criteria->student_id[0] != '\0' && strcmp(record->student_id, criteria->student_id) != 0) {
        return false;
    }
    if (criteria->name[0] != '\0' && strstr(record->name, criteria->name) == NULL) {
        return false;
    }
    if (criteria->course_name[0] != '\0' && strstr(record->course_name, criteria->course_name) == NULL) {
        return false;
    }
    if (criteria->semester[0] != '\0' && strcmp(record->semester, criteria->semester) != 0) {
        return false;
    }
    if (criteria->score_min >= 0 && record->score < criteria->score_min) {
        return false;
    }
    if (criteria->score_max >= 0 && record->score > criteria->score_max) {
        return false;
    }
    if (criteria->college[0] != '\0' && strcmp(record->college, criteria->college) != 0) {
        return false;
    }
    return true;
}

/**
 * @brief 按筛选条件从容器中筛选记录。
 * @param container 数据容器。
 * @param iface 数据结构接口。
 * @param criteria 筛选条件。
 * @param count 输出匹配记录数量。
 * @return 动态分配的记录指针数组，调用者负责释放。若无结果返回 NULL。
 */
Record** filter_records(const DataContainer* container, const DataInterface* iface,
                        const FilterCriteria* criteria, int* count) {
    if (!container || !iface || !criteria || !count) return NULL;

    int total = 0; /**< 容器中总记录数 */
    Record** all = iface->get_all_records((DataContainer*)container, &total); /**< 所有记录副本 */
    if (!all || total <= 0) {
        *count = 0;
        free(all);
        return NULL;
    }

    Record** results = (Record**)calloc(total, sizeof(Record*)); /**< 匹配结果指针数组 */
    if (!results) {
        for (int i = 0; i < total; ++i) free(all[i]);
        free(all);
        *count = 0;
        return NULL;
    }

    int matched = 0;
    for (int i = 0; i < total; ++i) {
        if (record_matches(all[i], criteria)) {
            results[matched++] = all[i];
        } else {
            free(all[i]);
        }
    }

    free(all);
    *count = matched;
    return results;
}

/**
 * @brief 对记录数组执行多关键字排序。
 * @param records 待排序记录数组。
 * @param count 数组元素数量。
 * @param keys 排序字段名数组。
 * @param orders 对应字段排序顺序，true 表示升序。
 * @param key_count 排序关键字数量。
 */
static int compare_records(const Record* a, const Record* b, const char* key) {
    if (strcmp(key, "score") == 0) {
        return a->score - b->score;
    }
    if (strcmp(key, "student_id") == 0) {
        return strcmp(a->student_id, b->student_id);
    }
    if (strcmp(key, "course_id") == 0) {
        return strcmp(a->course_id, b->course_id);
    }
    if (strcmp(key, "name") == 0) {
        return strcmp(a->name, b->name);
    }
    if (strcmp(key, "course_name") == 0) {
        return strcmp(a->course_name, b->course_name);
    }
    if (strcmp(key, "college") == 0) {
        return strcmp(a->college, b->college);
    }
    if (strcmp(key, "semester") == 0) {
        return strcmp(a->semester, b->semester);
    }
    if (strcmp(key, "credit") == 0) {
        if (a->credit < b->credit) return -1;
        if (a->credit > b->credit) return 1;
        return 0;
    }
    return 0;
}

void multi_key_sort(Record** records, int count, const char* keys[], const bool orders[], int key_count) {
    if (!records || count <= 1 || !keys || !orders || key_count <= 0) return;

    for (int i = 0; i < count - 1; ++i) {
        for (int j = i + 1; j < count; ++j) {
            Record* a = records[i];
            Record* b = records[j];
            int cmp = 0;
            for (int k = 0; k < key_count; ++k) {
                cmp = compare_records(a, b, keys[k]);
                if (cmp != 0) {
                    if (!orders[k]) cmp = -cmp;
                    break;
                }
            }
            if (cmp > 0) {
                Record* temp = records[i];
                records[i] = records[j];
                records[j] = temp;
            }
        }
    }
}
