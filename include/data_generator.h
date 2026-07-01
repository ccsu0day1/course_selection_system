#ifndef DATA_GENERATOR_H
#define DATA_GENERATOR_H

#include <stdbool.h>

/*
 * 生成测试数据 CSV 文件
 * count: 要生成的记录数
 * path: 输出文件路径
 * 返回 true 表示成功
 */
bool generate_csv(int count, const char* path);

#endif // DATA_GENERATOR_H
