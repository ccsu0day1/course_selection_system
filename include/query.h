#ifndef QUERY_H
#define QUERY_H

#include "common.h"

/**
 * @brief 按筛选条件从容器中筛选记录。
 * @param container 数据容器。
 * @param iface 数据结构接口。
 * @param criteria 筛选条件。
 * @param count 输出匹配记录数量。
 * @return 动态分配的 Record* 数组，调用者负责释放，若无结果返回 NULL。
 */
Record** filter_records(const DataContainer* container, const DataInterface* iface,
                        const FilterCriteria* criteria, int* count);

/**
 * @brief 对记录数组执行多关键字排序。
 * @param records 待排序的记录数组。
 * @param count 数组元素数量。
 * @param keys 排序字段名数组。
 * @param orders 对应排序方向数组，true 表示升序。
 * @param key_count 排序关键字数量。
 */
void multi_key_sort(Record** records, int count, const char* keys[], const bool orders[], int key_count);

#endif
