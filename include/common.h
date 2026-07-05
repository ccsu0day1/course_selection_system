#ifndef COMMON_H
#define COMMON_H

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <time.h>
#include <stdarg.h>

#ifdef _WIN32
#include <windows.h>
#endif

#ifdef _WIN32
int print_utf8_printf(const char* format, ...);
#define printf print_utf8_printf
#endif

#define MAX_ID_LEN 16
#define MAX_NAME_LEN 64
#define MAX_COURSE_ID_LEN 16
#define MAX_COURSE_NAME_LEN 64
#define MAX_COLLEGE_LEN 64
#define MAX_SEMESTER_LEN 16
#define MAX_DATE_LEN 16

/**
 * @struct Record
 * @brief 表示一条选课记录。
 * @details 本结构体存储单条学生选课信息，包含学号、姓名、学院、课程信息、学分、学期、选课日期和成绩。
 */
typedef struct Record {
    char student_id[MAX_ID_LEN]; /**< 学生学号，最大长度包含终止符 */
    char name[MAX_NAME_LEN]; /**< 学生姓名 */
    char college[MAX_COLLEGE_LEN]; /**< 学院名称 */
    char course_id[MAX_COURSE_ID_LEN]; /**< 课程编号 */
    char course_name[MAX_COURSE_NAME_LEN]; /**< 课程名称 */
    float credit; /**< 课程学分 */
    char semester[MAX_SEMESTER_LEN]; /**< 选课学期，如 2024-02 */
    char date[MAX_DATE_LEN]; /**< 选课日期，格式 YYYY-MM-DD */
    int score; /**< 课程成绩，0-100 */
} Record;

/**
 * @struct FilterCriteria
 * @brief 表示筛选条件。
 * @details 可用于多条件查询，包括课程名称、学期、成绩区间和学院。
 */
typedef struct FilterCriteria {
    char student_id[MAX_ID_LEN]; /**< 学号，精确匹配 */
    char name[MAX_NAME_LEN]; /**< 姓名，模糊匹配 */
    char course_name[MAX_COURSE_NAME_LEN]; /**< 课程名称，模糊匹配 */
    char semester[MAX_SEMESTER_LEN]; /**< 学期，精确匹配 */
    int score_min; /**< 最低成绩，-1 表示不限制 */
    int score_max; /**< 最高成绩，-1 表示不限制 */
    char college[MAX_COLLEGE_LEN]; /**< 学院名称，精确匹配 */
} FilterCriteria;

/**
 * @struct DataContainer
 * @brief 数据容器的通用封装，内部由具体数据结构实现。
 * @details 通过该结构体隐藏具体容器类型，使业务逻辑与链表/哈希表实现解耦。
 */
typedef struct DataContainer {
    void* internal; /**< 指向具体数据结构实现的内部指针 */
} DataContainer;

/**
 * @struct DataInterface
 * @brief 数据结构操作接口，封装链表或哈希表的通用行为。
 * @details 该接口定义了创建、销毁、增删改查、遍历等通用方法。
 */
typedef struct DataInterface {
    DataContainer* (*create)(void); /**< 创建容器实例 */
    void (*destroy)(DataContainer*); /**< 销毁容器并释放所有资源 */
    bool (*insert)(DataContainer*, const Record*); /**< 插入记录 */
    bool (*delete)(DataContainer*, const char*, const char*); /**< 删除记录 */
    bool (*update)(DataContainer*, const Record*); /**< 修改记录 */
    Record* (*find)(DataContainer*, const char*, const char*); /**< 查找并返回记录副本 */
    Record** (*get_all_records)(DataContainer*, int*); /**< 获取所有记录的副本数组 */
    int (*count)(DataContainer*); /**< 获取容器记录总数 */
} DataInterface;

/**
 * @brief 获取双向链表实现的数据接口。
 * @return 指向链表接口的只读指针。
 */
const DataInterface* get_list_interface(void);

/**
 * @brief 获取哈希表实现的数据接口。
 * @return 指向哈希表接口的只读指针。
 */
const DataInterface* get_hash_interface(void);

/**
 * @brief 获取 AVL 树实现的数据接口。
 * @return 指向 AVL 接口的只读指针。
 */
const DataInterface* get_avl_interface(void);

/**
 * @brief 在 Windows 上设置控制台编码为 GBK。
 * @details 该函数主要用于在中文 Windows 系统中保证打印和输入汉字显示正常。
 */
void set_console_encoding(void);

#endif
