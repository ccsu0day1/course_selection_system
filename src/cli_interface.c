#include "cli_interface.h"
#include "file_io.h"
#include "../include/data_generator.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void PrintMenu(void) {
    printf("\n========== 选课记录管理系统 ==========%s\n", "");
    printf("1. 加载数据\n");
    printf("2. 保存数据\n");
    printf("3. 插入记录\n");
    printf("4. 删除记录\n");
    printf("5. 查找记录\n");
    printf("6. 筛选记录\n");
    printf("7. 显示统计\n");
    printf("8. 删除过期记录\n");
    printf("9. 生成测试数据\n");
    printf("0. 退出\n");
    printf("请输入选项：");
}

int RunCli(RecordDatabase *db, const char *default_path) {
    if (!db || !default_path) {
        return 0;
    }

    int choice = -1;
    char input[256];
    char buffer[256];
    while (1) {
        PrintMenu();
        if (scanf("%d", &choice) != 1) {
            scanf("%*s");
            printf("输入无效，请重试。\n");
            continue;
        }
        getchar();

        switch (choice) {
            case 1:
                printf("请输入文件路径（回车使用默认 %s）：", default_path);
                fgets(input, sizeof(input), stdin);
                input[strcspn(input, "\n")] = '\0';
                if (strlen(input) == 0) {
                    strcpy(input, default_path);
                }
                load_from_csv(db, input);
                break;
            case 2:
                save_to_csv(db, default_path);
                break;
            case 3:
                {
                    SelectionRecord record = {0};
                    printf("学号：");
                    fgets(record.student_id, sizeof(record.student_id), stdin);
                    record.student_id[strcspn(record.student_id, "\n")] = '\0';
                    printf("姓名：");
                    fgets(record.name, sizeof(record.name), stdin);
                    record.name[strcspn(record.name, "\n")] = '\0';
                    printf("学院：");
                    fgets(record.college, sizeof(record.college), stdin);
                    record.college[strcspn(record.college, "\n")] = '\0';
                    printf("课程编号：");
                    fgets(record.course_id, sizeof(record.course_id), stdin);
                    record.course_id[strcspn(record.course_id, "\n")] = '\0';
                    printf("课程名称：");
                    fgets(record.course_name, sizeof(record.course_name), stdin);
                    record.course_name[strcspn(record.course_name, "\n")] = '\0';
                    printf("学分：");
                    fgets(buffer, sizeof(buffer), stdin);
                    record.credit = (float)atof(buffer);
                    printf("学期：");
                    fgets(record.semester, sizeof(record.semester), stdin);
                    record.semester[strcspn(record.semester, "\n")] = '\0';
                    printf("选课日期（YYYY-MM-DD）：");
                    fgets(record.selected_date, sizeof(record.selected_date), stdin);
                    record.selected_date[strcspn(record.selected_date, "\n")] = '\0';
                    printf("成绩：");
                    fgets(buffer, sizeof(buffer), stdin);
                    record.score = atoi(buffer);
                    InsertRecord(db, &record);
                }
                break;
            case 4:
                {
                    char sid[MAX_ID_LEN];
                    char cid[MAX_ID_LEN];
                    printf("学号：");
                    fgets(sid, sizeof(sid), stdin);
                    sid[strcspn(sid, "\n")] = '\0';
                    printf("课程编号：");
                    fgets(cid, sizeof(cid), stdin);
                    cid[strcspn(cid, "\n")] = '\0';
                    DeleteRecordByKey(db, sid, cid);
                }
                break;
            case 5:
                {
                    char sid[MAX_ID_LEN];
                    char cid[MAX_ID_LEN];
                    printf("学号：");
                    fgets(sid, sizeof(sid), stdin);
                    sid[strcspn(sid, "\n")] = '\0';
                    printf("课程编号：");
                    fgets(cid, sizeof(cid), stdin);
                    cid[strcspn(cid, "\n")] = '\0';
                    SelectionRecord *found = FindRecordByKey(db, sid, cid);
                    if (found) {
                        print_record(found);
                        free(found);
                    } else {
                        printf("未找到记录。\n");
                    }
                }
                break;
            case 6:
                {
                    char course_name[MAX_COURSE_NAME_LEN] = "";
                    char semester[MAX_SEMESTER_LEN] = "";
                    char college[MAX_COLLEGE_LEN] = "";
                    int min_score = -1;
                    int max_score = -1;
                    printf("课程名称关键字（回车表示不限制）：");
                    fgets(course_name, sizeof(course_name), stdin);
                    course_name[strcspn(course_name, "\n")] = '\0';
                    printf("学期（回车表示不限制）：");
                    fgets(semester, sizeof(semester), stdin);
                    semester[strcspn(semester, "\n")] = '\0';
                    printf("学院（回车表示不限制）：");
                    fgets(college, sizeof(college), stdin);
                    college[strcspn(college, "\n")] = '\0';
                    printf("最低成绩（-1表示不限制）：");
                    fgets(buffer, sizeof(buffer), stdin);
                    min_score = atoi(buffer);
                    printf("最高成绩（-1表示不限制）：");
                    fgets(buffer, sizeof(buffer), stdin);
                    max_score = atoi(buffer);
                    FilterAndPrint(db, course_name, semester, college, min_score, max_score);
                }
                break;
            case 7:
                ShowStatistics(db);
                break;
            case 8:
                printf("请输入过期基准日期（YYYY-MM-DD）：");
                fgets(buffer, sizeof(buffer), stdin);
                buffer[strcspn(buffer, "\n")] = '\0';
                printf("已删除 %d 条过期记录。\n", DeleteExpiredRecords(db, buffer));
                break;
            case 9:
                {
                    printf("\n===== 生成测试数据 =====\n");
                    printf("1. 生成 100 条 (data/generated_100.csv)\n");
                    printf("2. 生成 1000 条 (data/generated_1000.csv)\n");
                    printf("3. 生成 10000 条 (data/generated_10000.csv)\n");
                    printf("4. 自定义数量\n");
                    printf("请选择：");
                    int choice = 0;
                    if (scanf("%d", &choice) != 1) { scanf("%*s"); break; }
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
                            if (scanf("%d", &count) != 1) { scanf("%*s"); break; }
                            getchar();
                            printf("请输入输出文件路径（回车使用 data/generated_custom.csv）：");
                            fgets(custom_path, sizeof(custom_path), stdin);
                            custom_path[strcspn(custom_path, "\n")] = '\0';
                            if (strlen(custom_path) == 0) strcpy(custom_path, "data/generated_custom.csv");
                            path = custom_path;
                            break;
                        default:
                            printf("无效选择。\n");
                            break;
                    }
                    if (count <= 0 || !path) { break; }
                    if (generate_csv(count, path)) {
                        printf("已生成 %d 条记录到 %s\n", count, path);
                    } else {
                        printf("生成失败，请检查路径和权限。\n");
                    }
                }
                break;
            case 0:
                return 0;
            default:
                printf("无效选项，请重新输入。\n");
                break;
        }
    }
}
