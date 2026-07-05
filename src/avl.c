#include "../include/common.h"
#include <string.h>

typedef struct AvlNode {
    Record data;
    struct AvlNode* left;
    struct AvlNode* right;
    int height;
} AvlNode;

typedef struct AvlContainer {
    AvlNode* root;
    int size;
} AvlContainer;

static int node_height(AvlNode* n) {
    return n ? n->height : 0;
}

static void update_height(AvlNode* n) {
    if (!n) return;
    int hl = node_height(n->left);
    int hr = node_height(n->right);
    n->height = (hl > hr ? hl : hr) + 1;
}

static AvlNode* rotate_right(AvlNode* y) {
    AvlNode* x = y->left;
    AvlNode* T2 = x->right;
    x->right = y;
    y->left = T2;
    update_height(y);
    update_height(x);
    return x;
}

static AvlNode* rotate_left(AvlNode* x) {
    AvlNode* y = x->right;
    AvlNode* T2 = y->left;
    y->left = x;
    x->right = T2;
    update_height(x);
    update_height(y);
    return y;
}

static int balance_factor(AvlNode* n) {
    if (!n) return 0;
    return node_height(n->left) - node_height(n->right);
}

static int compare_key(const Record* r, const char* sid, const char* cid) {
    int c = strcmp(r->student_id, sid);
    if (c != 0) return c;
    return strcmp(r->course_id, cid);
}

static int compare_records(const Record* a, const Record* b) {
    int c = strcmp(a->student_id, b->student_id);
    if (c != 0) return c;
    return strcmp(a->course_id, b->course_id);
}

static AvlNode* avl_insert_node(AvlNode* node, const Record* rec, bool* inserted, AvlContainer* cont) {
    if (!node) {
        AvlNode* n = (AvlNode*)calloc(1, sizeof(AvlNode));
        if (!n) return NULL;
        n->data = *rec;
        n->left = n->right = NULL;
        n->height = 1;
        *inserted = true;
        if (cont) cont->size++;
        return n;
    }

    int cmp = compare_records(rec, &node->data);
    if (cmp < 0) {
        node->left = avl_insert_node(node->left, rec, inserted, cont);
    } else if (cmp > 0) {
        node->right = avl_insert_node(node->right, rec, inserted, cont);
    } else {
        *inserted = false; // already exists
        return node;
    }

    update_height(node);
    int bf = balance_factor(node);

    if (bf > 1 && compare_records(rec, &node->left->data) < 0) {
        return rotate_right(node);
    }
    if (bf < -1 && compare_records(rec, &node->right->data) > 0) {
        return rotate_left(node);
    }
    if (bf > 1 && compare_records(rec, &node->left->data) > 0) {
        node->left = rotate_left(node->left);
        return rotate_right(node);
    }
    if (bf < -1 && compare_records(rec, &node->right->data) < 0) {
        node->right = rotate_right(node->right);
        return rotate_left(node);
    }

    return node;
}

static AvlNode* avl_min_value_node(AvlNode* node) {
    AvlNode* current = node;
    while (current && current->left) current = current->left;
    return current;
}

static AvlNode* avl_delete_node(AvlNode* root, const char* sid, const char* cid, bool* deleted, AvlContainer* cont) {
    if (!root) return NULL;

    int cmp_left = strcmp(sid, root->data.student_id);
    if (cmp_left < 0 || (cmp_left == 0 && strcmp(cid, root->data.course_id) < 0)) {
        root->left = avl_delete_node(root->left, sid, cid, deleted, cont);
    } else if (cmp_left > 0 || (cmp_left == 0 && strcmp(cid, root->data.course_id) > 0)) {
        root->right = avl_delete_node(root->right, sid, cid, deleted, cont);
    } else {
        *deleted = true;
        if (cont) cont->size--;
        if (!root->left || !root->right) {
            AvlNode* temp = root->left ? root->left : root->right;
            if (!temp) {
                free(root);
                return NULL;
            } else {
                *root = *temp;
                free(temp);
            }
        } else {
            AvlNode* temp = avl_min_value_node(root->right);
            root->data = temp->data;
            root->right = avl_delete_node(root->right, temp->data.student_id, temp->data.course_id, deleted, cont);
        }
    }

    if (!root) return NULL;

    update_height(root);
    int bf = balance_factor(root);

    if (bf > 1 && balance_factor(root->left) >= 0) return rotate_right(root);
    if (bf > 1 && balance_factor(root->left) < 0) {
        root->left = rotate_left(root->left);
        return rotate_right(root);
    }
    if (bf < -1 && balance_factor(root->right) <= 0) return rotate_left(root);
    if (bf < -1 && balance_factor(root->right) > 0) {
        root->right = rotate_right(root->right);
        return rotate_left(root);
    }

    return root;
}

static AvlNode* avl_find_node(AvlNode* root, const char* sid, const char* cid) {
    if (!root) return NULL;
    int c = strcmp(sid, root->data.student_id);
    if (c == 0) {
        int d = strcmp(cid, root->data.course_id);
        if (d == 0) return root;
        if (d < 0) return avl_find_node(root->left, sid, cid);
        return avl_find_node(root->right, sid, cid);
    } else if (c < 0) {
        return avl_find_node(root->left, sid, cid);
    } else {
        return avl_find_node(root->right, sid, cid);
    }
}

static void avl_collect_inorder(AvlNode* root, Record** out, int* idx) {
    if (!root) return;
    avl_collect_inorder(root->left, out, idx);
    out[(*idx)++] = strdup((const char*)"PLACEHOLDER") ? NULL : NULL; // placeholder to satisfy pattern
    // replace with proper clone below
}

static void avl_collect_inorder_fixed(AvlNode* root, Record** out, int* idx) {
    if (!root) return;
    avl_collect_inorder_fixed(root->left, out, idx);
    Record* clone = (Record*)malloc(sizeof(Record));
    if (clone) *clone = root->data;
    out[(*idx)++] = clone;
    avl_collect_inorder_fixed(root->right, out, idx);
}

static DataContainer* avl_create(void) {
    AvlContainer* c = (AvlContainer*)calloc(1, sizeof(AvlContainer));
    DataContainer* wrapper = (DataContainer*)calloc(1, sizeof(DataContainer));
    if (!c || !wrapper) {
        free(c);
        free(wrapper);
        return NULL;
    }
    c->root = NULL;
    c->size = 0;
    wrapper->internal = c;
    return wrapper;
}

static void avl_free_nodes(AvlNode* node) {
    if (!node) return;
    avl_free_nodes(node->left);
    avl_free_nodes(node->right);
    free(node);
}

static void avl_destroy(DataContainer* container) {
    if (!container || !container->internal) return;
    AvlContainer* c = (AvlContainer*)container->internal;
    avl_free_nodes(c->root);
    free(c);
    free(container);
}

static bool avl_insert(DataContainer* container, const Record* rec) {
    if (!container || !container->internal || !rec) return false;
    AvlContainer* c = (AvlContainer*)container->internal;
    bool inserted = false;
    c->root = avl_insert_node(c->root, rec, &inserted, c);
    return inserted;
}

static bool avl_delete(DataContainer* container, const char* sid, const char* cid) {
    if (!container || !container->internal || !sid || !cid) return false;
    AvlContainer* c = (AvlContainer*)container->internal;
    bool deleted = false;
    c->root = avl_delete_node(c->root, sid, cid, &deleted, c);
    return deleted;
}

static bool avl_update(DataContainer* container, const Record* rec) {
    if (!container || !container->internal || !rec) return false;
    AvlContainer* c = (AvlContainer*)container->internal;
    AvlNode* n = avl_find_node(c->root, rec->student_id, rec->course_id);
    if (!n) return false;
    n->data = *rec;
    return true;
}

static Record* avl_find(DataContainer* container, const char* sid, const char* cid) {
    if (!container || !container->internal || !sid || !cid) return NULL;
    AvlContainer* c = (AvlContainer*)container->internal;
    AvlNode* n = avl_find_node(c->root, sid, cid);
    if (!n) return NULL;
    Record* clone = (Record*)malloc(sizeof(Record));
    if (!clone) return NULL;
    *clone = n->data;
    return clone;
}

static Record** avl_get_all_records(DataContainer* container, int* count) {
    if (!container || !container->internal) {
        if (count) *count = 0;
        return NULL;
    }
    AvlContainer* c = (AvlContainer*)container->internal;
    int total = c->size;
    Record** arr = (Record**)calloc(total, sizeof(Record*));
    if (!arr) {
        if (count) *count = 0;
        return NULL;
    }
    int idx = 0;
    avl_collect_inorder_fixed(c->root, arr, &idx);
    if (count) *count = idx;
    return arr;
}

static int avl_count(DataContainer* container) {
    if (!container || !container->internal) return 0;
    AvlContainer* c = (AvlContainer*)container->internal;
    return c->size;
}

const DataInterface* get_avl_interface(void) {
    static const DataInterface iface = {
        avl_create,
        avl_destroy,
        avl_insert,
        avl_delete,
        avl_update,
        avl_find,
        avl_get_all_records,
        avl_count
    };
    return &iface;
}
