#ifndef DATA_STRUCTURE_H
#define DATA_STRUCTURE_H

#include <stdbool.h>
#include <stdint.h>

#define MAX_ID_LEN 16
#define MAX_NAME_LEN 64
#define MAX_COURSE_NAME_LEN 64
#define MAX_COLLEGE_LEN 64
#define MAX_SEMESTER_LEN 16
#define MAX_DATE_LEN 16

/**
 * @brief 单条选课记录结构体。
 */
typedef struct {
    char student_id[MAX_ID_LEN];
    char name[MAX_NAME_LEN];
    char college[MAX_COLLEGE_LEN];
    char course_id[MAX_ID_LEN];
    char course_name[MAX_COURSE_NAME_LEN];
    float credit;
    char semester[MAX_SEMESTER_LEN];
    char selected_date[MAX_DATE_LEN];
    int score;
} CourseRecord;

/**
 * @brief 选课记录别名，用于兼容不同模块命名风格。
 */
typedef CourseRecord SelectionRecord;

void copy_record(CourseRecord *dst, const CourseRecord *src);
void print_record(const CourseRecord *record);
unsigned int hash_code(const char *value);
bool is_record_expired(const CourseRecord *record, const char *base_date);

#endif // DATA_STRUCTURE_H
