#include "../include/storage.h"

/**
 * @brief 解析 CSV 一行并填充 Record 结构体。
 * @param line 输入 CSV 行，内部会被 strtok 修改。
 * @param record 输出记录。
 * @return 成功解析返回 true，否则返回 false。
 */
static bool parse_csv_line(char* line, Record* record) {
    char* fields[9] = {0}; /**< 用于存放 CSV 字段指针 */
    char* token = strtok(line, ","); /**< 逐字段分割 */
    int index = 0; /**< 当前字段索引 */
    while (token != NULL && index < 9) {
        fields[index++] = token;
        token = strtok(NULL, ",");
    }

    if (index != 9) return false;

    strncpy(record->student_id, fields[0], sizeof(record->student_id) - 1);
    strncpy(record->name, fields[1], sizeof(record->name) - 1);
    strncpy(record->college, fields[2], sizeof(record->college) - 1);
    strncpy(record->course_id, fields[3], sizeof(record->course_id) - 1);
    strncpy(record->course_name, fields[4], sizeof(record->course_name) - 1);
    record->credit = (float)atof(fields[5]);
    strncpy(record->semester, fields[6], sizeof(record->semester) - 1);
    strncpy(record->date, fields[7], sizeof(record->date) - 1);
    record->score = atoi(fields[8]);

    record->student_id[sizeof(record->student_id) - 1] = '\0';
    record->name[sizeof(record->name) - 1] = '\0';
    record->college[sizeof(record->college) - 1] = '\0';
    record->course_id[sizeof(record->course_id) - 1] = '\0';
    record->course_name[sizeof(record->course_name) - 1] = '\0';
    record->semester[sizeof(record->semester) - 1] = '\0';
    record->date[sizeof(record->date) - 1] = '\0';
    return true;
}

/**
 * @brief 从 CSV 文件加载数据到容器。
 * @param container 目标数据容器。
 * @param path CSV 文件路径。
 * @param iface 数据结构接口。
 * @return 成功加载的记录数，失败返回 -1。
 */
int load_from_csv(DataContainer* container, const char* path, const DataInterface* iface) {
    if (!container || !iface || !path) return -1;
    FILE* file = fopen(path, "rb"); /**< 以二进制方式读取 CSV，支持 UTF-8 BOM 识别 */
    if (!file) return -1;

    char line[1024]; /**< 单行读取缓冲区 */
    int count = 0; /**< 已加载记录数量 */
    while (fgets(line, sizeof(line), file)) {
        if (count == 0 && (unsigned char)line[0] == 0xEF && (unsigned char)line[1] == 0xBB && (unsigned char)line[2] == 0xBF) {
            memmove(line, line + 3, strlen(line + 3) + 1);
        }
        if (line[0] == '\n' || line[0] == '\r' || line[0] == '\0') continue;
        Record record; /**< 单条记录临时存放 */
        memset(&record, 0, sizeof(record));
        if (!parse_csv_line(line, &record)) continue;
        if (iface->insert(container, &record)) count++;
    }
    fclose(file);
    return count;
}

/**
 * @brief 将容器中的记录保存为 CSV 文件。
 */
int save_to_csv(const DataContainer* container, const char* path, const DataInterface* iface) {
    if (!container || !iface || !path) return -1;
    FILE* file = fopen(path, "wb"); /**< 以二进制方式写入 CSV，并写入 UTF-8 BOM */
    if (!file) return -1;
    const unsigned char bom[] = {0xEF, 0xBB, 0xBF};
    fwrite(bom, 1, sizeof(bom), file);

    int total = 0; /**< 容器记录数 */
    Record** records = iface->get_all_records((DataContainer*)container, &total); /**< 获取所有记录副本 */
    if (!records) {
        fclose(file);
        return 0;
    }

    for (int i = 0; i < total; ++i) {
        fprintf(file, "%s,%s,%s,%s,%s,%.1f,%s,%s,%d\n",
                records[i]->student_id, records[i]->name, records[i]->college,
                records[i]->course_id, records[i]->course_name, records[i]->credit,
                records[i]->semester, records[i]->date, records[i]->score);
    }

    for (int i = 0; i < total; ++i) free(records[i]);
    free(records);
    fclose(file);
    return total;
}

/**
 * @brief 导出筛选结果到 CSV 文件。
 */
bool export_to_csv(Record** records, int count, const char* path) {
    if (!records || count <= 0 || !path) return false;
    FILE* file = fopen(path, "wb"); /**< 以二进制方式导出 CSV，并写入 UTF-8 BOM */
    if (!file) return false;
    const unsigned char bom[] = {0xEF, 0xBB, 0xBF};
    fwrite(bom, 1, sizeof(bom), file);

    for (int i = 0; i < count; ++i) {
        fprintf(file, "%s,%s,%s,%s,%s,%.1f,%s,%s,%d\n",
                records[i]->student_id, records[i]->name, records[i]->college,
                records[i]->course_id, records[i]->course_name, records[i]->credit,
                records[i]->semester, records[i]->date, records[i]->score);
    }

    fclose(file);
    return true;
}
