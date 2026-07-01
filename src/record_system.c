#include "record_system.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void RecordDatabaseInit(RecordDatabase *db) {
    if (!db) {
        return;
    }
    db->records = NULL;
    db->count = 0;
    db->capacity = 0;
}

void RecordDatabaseFree(RecordDatabase *db) {
    if (!db) {
        return;
    }
    free(db->records);
    db->records = NULL;
    db->count = 0;
    db->capacity = 0;
}

static bool ensure_capacity(RecordDatabase *db, int min_capacity) {
    if (db->capacity >= min_capacity) {
        return true;
    }
    int new_capacity = db->capacity > 0 ? db->capacity * 2 : 16;
    if (new_capacity < min_capacity) {
        new_capacity = min_capacity;
    }
    SelectionRecord *new_records = realloc(db->records, sizeof(SelectionRecord) * new_capacity);
    if (!new_records) {
        return false;
    }
    db->records = new_records;
    db->capacity = new_capacity;
    return true;
}

bool InsertRecord(RecordDatabase *db, const SelectionRecord *record) {
    if (!db || !record) {
        return false;
    }

    for (int i = 0; i < db->count; ++i) {
        if (strcmp(db->records[i].student_id, record->student_id) == 0 &&
            strcmp(db->records[i].course_id, record->course_id) == 0) {
            return false;
        }
    }

    if (!ensure_capacity(db, db->count + 1)) {
        return false;
    }

    db->records[db->count++] = *record;
    return true;
}

bool DeleteRecordByKey(RecordDatabase *db, const char *student_id, const char *course_id) {
    if (!db || !student_id || !course_id) {
        return false;
    }

    for (int i = 0; i < db->count; ++i) {
        if (strcmp(db->records[i].student_id, student_id) == 0 &&
            strcmp(db->records[i].course_id, course_id) == 0) {
            for (int j = i; j < db->count - 1; ++j) {
                db->records[j] = db->records[j + 1];
            }
            db->count--;
            return true;
        }
    }
    return false;
}

SelectionRecord *FindRecordByKey(RecordDatabase *db, const char *student_id, const char *course_id) {
    if (!db || !student_id || !course_id) {
        return NULL;
    }

    for (int i = 0; i < db->count; ++i) {
        if (strcmp(db->records[i].student_id, student_id) == 0 &&
            strcmp(db->records[i].course_id, course_id) == 0) {
            SelectionRecord *result = malloc(sizeof(SelectionRecord));
            if (result) {
                *result = db->records[i];
            }
            return result;
        }
    }
    return NULL;
}

bool UpdateRecordScore(RecordDatabase *db, const char *student_id, const char *course_id, int new_score) {
    if (!db || !student_id || !course_id) {
        return false;
    }

    for (int i = 0; i < db->count; ++i) {
        if (strcmp(db->records[i].student_id, student_id) == 0 &&
            strcmp(db->records[i].course_id, course_id) == 0) {
            db->records[i].score = new_score;
            return true;
        }
    }
    return false;
}

void PrintAllRecords(const RecordDatabase *db) {
    if (!db || db->count == 0) {
        printf("当前无记录。\n");
        return;
    }
    for (int i = 0; i < db->count; ++i) {
        print_record(&db->records[i]);
    }
}

void ShowStatistics(const RecordDatabase *db) {
    if (!db || db->count == 0) {
        printf("没有可统计的数据。\n");
        return;
    }

    printf("总记录数：%d\n", db->count);
}

void FilterAndPrint(const RecordDatabase *db, const char *course_name, const char *semester, const char *college, int min_score, int max_score) {
    if (!db) {
        return;
    }

    int matched = 0;
    for (int i = 0; i < db->count; ++i) {
        const SelectionRecord *record = &db->records[i];
        if (course_name[0] && strstr(record->course_name, course_name) == NULL) {
            continue;
        }
        if (semester[0] && strcmp(record->semester, semester) != 0) {
            continue;
        }
        if (college[0] && strcmp(record->college, college) != 0) {
            continue;
        }
        if (min_score >= 0 && record->score < min_score) {
            continue;
        }
        if (max_score >= 0 && record->score > max_score) {
            continue;
        }
        print_record(record);
        matched++;
    }
    if (matched == 0) {
        printf("未找到匹配记录。\n");
    }
}

int DeleteExpiredRecords(RecordDatabase *db, const char *base_date) {
    if (!db || !base_date) {
        return 0;
    }

    int delete_count = 0;
    for (int i = 0; i < db->count; ) {
        if (is_record_expired(&db->records[i], base_date)) {
            DeleteRecordByKey(db, db->records[i].student_id, db->records[i].course_id);
            delete_count++;
        } else {
            i++;
        }
    }
    return delete_count;
}
