#include "../include/common.h"

#define HASH_BUCKETS 101

/**
 * @struct HashNode
 * @brief 哈希表节点。
 */
typedef struct HashNode {
    Record data;
    struct HashNode* next;
} HashNode;

/**
 * @struct HashContainer
 * @brief 哈希表容器。
 */
typedef struct HashContainer {
    HashNode* buckets[HASH_BUCKETS];
    int size;
} HashContainer;

/**
 * @brief 计算学号和课程编号的哈希值。
 * @param student_id 学号字符串。
 * @param course_id 课程编号字符串。
 * @return 计算后的哈希桶索引。
 */
static unsigned int hash_key(const char* student_id, const char* course_id) {
    unsigned int hash = 5381;
    const unsigned char* p = (const unsigned char*)student_id; /**< 遍历学号字符 */
    while (*p) hash = ((hash << 5) + hash) ^ *p++;
    p = (const unsigned char*)course_id; /**< 遍历课程编号字符 */
    while (*p) hash = ((hash << 5) + hash) ^ *p++;
    return hash % HASH_BUCKETS;
}

static HashNode* hash_find_node(HashContainer* container, const char* student_id, const char* course_id) {
    unsigned int idx = hash_key(student_id, course_id);
    HashNode* current = container->buckets[idx];
    while (current != NULL) {
        if (strcmp(current->data.student_id, student_id) == 0 && strcmp(current->data.course_id, course_id) == 0) {
            return current;
        }
        current = current->next;
    }
    return NULL;
}

/**
 * @brief 创建哈希表容器。
 * @return 返回封装后的 DataContainer，失败返回 NULL。
 */
static DataContainer* hash_create(void) {
    HashContainer* container = (HashContainer*)calloc(1, sizeof(HashContainer)); /**< 哈希表内部结构 */
    DataContainer* wrapper = (DataContainer*)calloc(1, sizeof(DataContainer)); /**< 对外封装指针 */
    if (!container || !wrapper) {
        free(container);
        free(wrapper);
        return NULL;
    }
    wrapper->internal = container;
    return wrapper;
}

static void hash_destroy(DataContainer* container) {
    if (!container || !container->internal) return;
    HashContainer* hash = (HashContainer*)container->internal;
    for (int i = 0; i < HASH_BUCKETS; ++i) {
        HashNode* current = hash->buckets[i];
        while (current != NULL) {
            HashNode* next = current->next;
            free(current);
            current = next;
        }
    }
    free(hash);
    free(container);
}

/**
 * @brief 向哈希表插入记录。
 * @param container 哈希表容器。
 * @param record 待插入记录。
 * @return 插入成功返回 true，失败返回 false。
 */
static bool hash_insert(DataContainer* container, const Record* record) {
    if (!container || !container->internal || !record) return false;
    HashContainer* hash = (HashContainer*)container->internal; /**< 哈希表内部结构 */
    if (hash_find_node(hash, record->student_id, record->course_id) != NULL) return false;

    HashNode* node = (HashNode*)calloc(1, sizeof(HashNode)); /**< 新节点 */
    if (!node) return false;
    node->data = *record;
    unsigned int idx = hash_key(record->student_id, record->course_id); /**< 目标桶索引 */
    node->next = hash->buckets[idx];
    hash->buckets[idx] = node;
    hash->size++;
    return true;
}

static bool hash_delete(DataContainer* container, const char* student_id, const char* course_id) {
    if (!container || !container->internal) return false;
    HashContainer* hash = (HashContainer*)container->internal;
    unsigned int idx = hash_key(student_id, course_id);
    HashNode* current = hash->buckets[idx];
    HashNode* prev = NULL;
    while (current != NULL) {
        if (strcmp(current->data.student_id, student_id) == 0 && strcmp(current->data.course_id, course_id) == 0) {
            if (prev) {
                prev->next = current->next;
            } else {
                hash->buckets[idx] = current->next;
            }
            free(current);
            hash->size--;
            return true;
        }
        prev = current;
        current = current->next;
    }
    return false;
}

static bool hash_update(DataContainer* container, const Record* record) {
    if (!container || !container->internal || !record) return false;
    HashContainer* hash = (HashContainer*)container->internal;
    HashNode* node = hash_find_node(hash, record->student_id, record->course_id);
    if (!node) return false;
    node->data = *record;
    return true;
}

static Record* hash_find(DataContainer* container, const char* student_id, const char* course_id) {
    if (!container || !container->internal) return NULL;
    HashContainer* hash = (HashContainer*)container->internal;
    HashNode* node = hash_find_node(hash, student_id, course_id);
    if (!node) return NULL;

    Record* result = (Record*)malloc(sizeof(Record));
    if (!result) return NULL;
    *result = node->data;
    return result;
}

/**
 * @brief 获取哈希表中所有记录的副本数组。
 * @param container 哈希表容器。
 * @param count 输出记录数量。
 * @return 动态分配的 Record* 数组，调用者负责释放。
 */
static Record** hash_get_all_records(DataContainer* container, int* count) {
    if (!container || !container->internal) {
        if (count) *count = 0;
        return NULL;
    }
    HashContainer* hash = (HashContainer*)container->internal; /**< 哈希表内部结构 */
    Record** records = (Record**)calloc(hash->size, sizeof(Record*)); /**< 记录副本数组 */
    if (!records) {
        if (count) *count = 0;
        return NULL;
    }

    int index = 0; /**< 当前记录索引 */
    for (int i = 0; i < HASH_BUCKETS; ++i) {
        HashNode* current = hash->buckets[i];
        while (current != NULL) {
            Record* clone = (Record*)malloc(sizeof(Record)); /**< 记录副本 */
            if (!clone) {
                for (int j = 0; j < index; ++j) free(records[j]);
                free(records);
                if (count) *count = 0;
                return NULL;
            }
            *clone = current->data;
            records[index++] = clone;
            current = current->next;
        }
    }

    if (count) *count = index;
    return records;
}

static int hash_count(DataContainer* container) {
    if (!container || !container->internal) return 0;
    return ((HashContainer*)container->internal)->size;
}

const DataInterface* get_hash_interface(void) {
    static const DataInterface iface = {
        hash_create,
        hash_destroy,
        hash_insert,
        hash_delete,
        hash_update,
        hash_find,
        hash_get_all_records,
        hash_count
    };
    return &iface;
}
