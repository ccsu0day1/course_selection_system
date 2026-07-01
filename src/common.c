#include "../include/common.h"

/**
 * @brief 设置控制台编码，确保输出可正确显示 GBK 内容。
 */
void set_console_encoding(void) {
#ifdef _WIN32
    SetConsoleOutputCP(CP_UTF8);
    SetConsoleCP(CP_UTF8);
    setlocale(LC_ALL, ".UTF8");
#else
    setlocale(LC_ALL, "");
#endif
}
