#ifndef RECORD_SYSTEM_H
#define RECORD_SYSTEM_H

#include <stdbool.h>
#include "data_structure.h"

/**
 * @brief 记录数据库容器。
 */
typedef struct {
    SelectionRecord *records;
    int count;
    int capacity;
} RecordDatabase;

void RecordDatabaseInit(RecordDatabase *db);
void RecordDatabaseFree(RecordDatabase *db);

bool InsertRecord(RecordDatabase *db, const SelectionRecord *record);
bool DeleteRecordByKey(RecordDatabase *db, const char *student_id, const char *course_id);
SelectionRecord *FindRecordByKey(RecordDatabase *db, const char *student_id, const char *course_id);
bool UpdateRecordScore(RecordDatabase *db, const char *student_id, const char *course_id, int new_score);

void PrintAllRecords(const RecordDatabase *db);
void ShowStatistics(const RecordDatabase *db);
void FilterAndPrint(const RecordDatabase *db, const char *course_name, const char *semester, const char *college, int min_score, int max_score);
int DeleteExpiredRecords(RecordDatabase *db, const char *base_date);

#endif // RECORD_SYSTEM_H
