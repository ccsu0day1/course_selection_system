#include "../include/common.h"
#include "../include/app.h"

int main(int argc, char *argv[]) {
    (void)argc;
    (void)argv;
    set_console_encoding();
    run_app();
    return 0;
}
