#ifndef STORAGE_H
#define STORAGE_H

#include "common.h"

/**
 * @brief 从 CSV 文件加载数据到容器。
 * @param container 目标数据容器。
 * @param path CSV 文件路径。
 * @param iface 数据结构接口。
 * @return 成功加载的记录数，失败返回 -1。
 */
int load_from_csv(DataContainer* container, const char* path, const DataInterface* iface);

/**
 * @brief 将容器中的数据保存为 CSV 文件。
 * @param container 源数据容器。
 * @param path 目标文件路径。
 * @param iface 数据结构接口。
 * @return 成功保存的记录数，失败返回 -1。
 */
int save_to_csv(const DataContainer* container, const char* path, const DataInterface* iface);

/**
 * @brief 导出一组记录到 CSV 文件。
 * @param records 记录指针数组。
 * @param count 记录数量。
 * @param path 目标文件路径。
 * @return 成功返回 true，否则返回 false。
 */
bool export_to_csv(Record** records, int count, const char* path);

#endif
