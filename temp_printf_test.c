#include "include/common.h"

int main(void) {
    set_console_encoding();
    print_utf8_printf("hello %s %d\n", "world", 42);
    printf("ok %s %d\n", "good", 99);
    return 0;
}
