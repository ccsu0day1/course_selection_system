#include "../include/common.h"

/**
 * @struct ListNode
 * @brief 双向链表节点。
 */
typedef struct ListNode {
    Record data;
    struct ListNode* prev;
    struct ListNode* next;
} ListNode;

/**
 * @struct ListContainer
 * @brief 双向链表容器。
 */
typedef struct ListContainer {
    ListNode* head;
    ListNode* tail;
    int size;
} ListContainer;

/**
 * @brief 在链表中查找指定学号和课程编号的节点。
 * @param container 双向链表容器。
 * @param student_id 查找的学号。
 * @param course_id 查找的课程编号。
 * @return 找到返回节点指针，否则返回 NULL。
 */
static ListNode* list_find_node(ListContainer* container, const char* student_id, const char* course_id) {
    ListNode* current = container->head; /**< 当前遍历节点 */
    while (current != NULL) {
        if (strcmp(current->data.student_id, student_id) == 0 && strcmp(current->data.course_id, course_id) == 0) {
            return current;
        }
        current = current->next;
    }
    return NULL;
}

/**
 * @brief 创建双向链表容器。
 * @return 返回封装后的 DataContainer，失败返回 NULL。
 */
static DataContainer* list_create(void) {
    ListContainer* container = (ListContainer*)calloc(1, sizeof(ListContainer)); /**< 链表内部结构 */
    DataContainer* wrapper = (DataContainer*)calloc(1, sizeof(DataContainer)); /**< 对外封装指针 */
    if (!container || !wrapper) {
        free(container);
        free(wrapper);
        return NULL;
    }
    container->head = NULL;
    container->tail = NULL;
    container->size = 0;
    wrapper->internal = container;
    return wrapper;
}

static void list_destroy(DataContainer* container) {
    if (!container || !container->internal) return;
    ListContainer* list = (ListContainer*)container->internal;
    ListNode* current = list->head;
    while (current != NULL) {
        ListNode* next = current->next;
        free(current);
        current = next;
    }
    free(list);
    free(container);
}

static bool list_insert(DataContainer* container, const Record* record) {
    if (!container || !container->internal || !record) return false;
    ListContainer* list = (ListContainer*)container->internal;
    if (list_find_node(list, record->student_id, record->course_id) != NULL) {
        return false;
    }

    ListNode* node = (ListNode*)calloc(1, sizeof(ListNode));
    if (!node) return false;

    node->data = *record;
    node->prev = list->tail;
    node->next = NULL;

    if (list->tail) {
        list->tail->next = node;
    } else {
        list->head = node;
    }
    list->tail = node;
    list->size++;
    return true;
}

static bool list_delete(DataContainer* container, const char* student_id, const char* course_id) {
    if (!container || !container->internal) return false;
    ListContainer* list = (ListContainer*)container->internal;
    ListNode* node = list_find_node(list, student_id, course_id);
    if (!node) return false;

    if (node->prev) {
        node->prev->next = node->next;
    } else {
        list->head = node->next;
    }
    if (node->next) {
        node->next->prev = node->prev;
    } else {
        list->tail = node->prev;
    }
    free(node);
    list->size--;
    return true;
}

static bool list_update(DataContainer* container, const Record* record) {
    if (!container || !container->internal || !record) return false;
    ListContainer* list = (ListContainer*)container->internal;
    ListNode* node = list_find_node(list, record->student_id, record->course_id);
    if (!node) return false;
    node->data = *record;
    return true;
}

static Record* list_find(DataContainer* container, const char* student_id, const char* course_id) {
    if (!container || !container->internal) return NULL;
    ListContainer* list = (ListContainer*)container->internal;
    ListNode* node = list_find_node(list, student_id, course_id);
    if (!node) return NULL;

    Record* result = (Record*)malloc(sizeof(Record));
    if (!result) return NULL;
    *result = node->data;
    return result;
}

/**
 * @brief 获取链表中所有记录的副本数组。
 * @param container 链表容器封装。
 * @param count 输出记录数量。
 * @return 动态分配的 Record* 数组，调用者负责释放。
 */
static Record** list_get_all_records(DataContainer* container, int* count) {
    if (!container || !container->internal) {
        if (count) *count = 0;
        return NULL;
    }
    ListContainer* list = (ListContainer*)container->internal; /**< 链表内部结构 */
    Record** records = (Record**)calloc(list->size, sizeof(Record*)); /**< 记录副本数组 */
    if (!records) {
        if (count) *count = 0;
        return NULL;
    }

    int index = 0; /**< 当前记录索引 */
    ListNode* current = list->head;
    while (current != NULL) {
        Record* clone = (Record*)malloc(sizeof(Record)); /**< 记录副本 */
        if (!clone) {
            for (int i = 0; i < index; ++i) free(records[i]);
            free(records);
            if (count) *count = 0;
            return NULL;
        }
        *clone = current->data;
        records[index++] = clone;
        current = current->next;
    }

    if (count) *count = index;
    return records;
}

static int list_count(DataContainer* container) {
    if (!container || !container->internal) return 0;
    return ((ListContainer*)container->internal)->size;
}

const DataInterface* get_list_interface(void) {
    static const DataInterface iface = {
        list_create,
        list_destroy,
        list_insert,
        list_delete,
        list_update,
        list_find,
        list_get_all_records,
        list_count
    };
    return &iface;
}
