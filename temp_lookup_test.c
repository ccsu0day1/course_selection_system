#include "include/common.h"
#include "include/storage.h"

int main(void) {
    set_console_encoding();
    const DataInterface* iface = get_hash_interface();
    DataContainer* container = iface->create();
    if (!container) {
        printf("create fail\n");
        return 1;
    }

    int loaded = load_from_csv(container, "data/generated_1000.csv", iface);
    printf("loaded=%d\n", loaded);

    Record* rec = iface->find(container, "202400000170", "C1003758");
    if (rec) {
        printf("found student=%s course=%s name=%s\n", rec->student_id, rec->course_id, rec->name);
        free(rec);
    } else {
        printf("not found\n");
    }

    iface->destroy(container);
    return 0;
}
