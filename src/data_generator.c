#include "../include/data_generator.h"
#include "../include/common.h"
#include <stdio.h>
#include <time.h>

static const char* sample_first[] = {
    "Li", "Wang", "Zhang", "Liu", "Chen", "Yang", "Zhao", "Huang", "Zhou", "Xu"
};
static const char* sample_last[] = {
    "Wei", "Fang", "Hua", "Jun", "Lei", "Peng", "Qiang", "Ming", "Tao", "Na"
};
static const char* colleges[] = {
    "计算机学院", "数学学院", "物理学院", "电子学院", "经济学院", "外语学院"
};
static const char* course_names[] = {
    "数据结构", "操作系统", "计算机网络", "数据库系统", "算法设计", "编译原理", "人工智能", "离散数学"
};

/* 生成 YYYY-MM-DD 格式的随机日期，范围 [start_year,start_year+2] */
static void rand_date(char* buf, size_t bufsz) {
    int year = 2022 + (rand() % 3); /* 2022-2024 */
    int month = 1 + (rand() % 12);
    int day;
    /* 简单处理每月天数 */
    if (month == 2) day = 1 + (rand() % 28);
    else if (month==4||month==6||month==9||month==11) day = 1 + (rand() % 30);
    else day = 1 + (rand() % 31);
    snprintf(buf, bufsz, "%04d-%02d-%02d", year, month, day);
}

bool generate_csv(int count, const char* path) {
    if (count <= 0 || !path) return false;
    FILE* f = fopen(path, "w");
    if (!f) return false;

    srand((unsigned int)time(NULL));

    for (int i = 0; i < count; ++i) {
        char student_id[MAX_ID_LEN];
        /* 12 位学号，保证唯一性通过序号 */
        /* 使用年份前缀 + 序号生成 12 位学号，避免大整数格式问题 */
        snprintf(student_id, sizeof(student_id), "2024%08d", i);

        const char* fname = sample_first[rand() % (sizeof(sample_first)/sizeof(sample_first[0]))];
        const char* lname = sample_last[rand() % (sizeof(sample_last)/sizeof(sample_last[0]))];
        char name[MAX_NAME_LEN];
        snprintf(name, sizeof(name), "%s%s", fname, lname);

        const char* college = colleges[rand() % (sizeof(colleges)/sizeof(colleges[0]))];

        char course_id[MAX_COURSE_ID_LEN];
        snprintf(course_id, sizeof(course_id), "C%07d", 1000000 + (rand() % 9000000));

        const char* course_name = course_names[rand() % (sizeof(course_names)/sizeof(course_names[0]))];

        float credits_pool[] = {1.0f, 2.0f, 3.0f, 4.0f};
        float credit = credits_pool[rand() % (sizeof(credits_pool)/sizeof(credits_pool[0]))];

        const char* semesters[] = {"2022-09", "2023-02", "2023-09", "2024-02", "2024-09"};
        const char* semester = semesters[rand() % (sizeof(semesters)/sizeof(semesters[0]))];

        char date[MAX_DATE_LEN];
        rand_date(date, sizeof(date));

        int score = rand() % 101; /* 0-100 */

        /* 写入 CSV，无表头，9 个字段 */
        fprintf(f, "%s,%s,%s,%s,%s,%.1f,%s,%s,%d\n",
                student_id, name, college, course_id, course_name,
                credit, semester, date, score);
    }

    fclose(f);
    return true;
}
