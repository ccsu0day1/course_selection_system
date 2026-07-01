#include "../include/common.h"

#ifdef _WIN32
#include <fcntl.h>
#include <io.h>
#endif

static bool is_console_handle(HANDLE handle) {
    if (handle == INVALID_HANDLE_VALUE || handle == NULL) return false;
    DWORD mode;
    return GetConsoleMode(handle, &mode) != 0;
}

int print_utf8_printf(const char* format, ...) {
    va_list args;
    va_start(args, format);
    int size = vsnprintf(NULL, 0, format, args);
    va_end(args);
    if (size < 0) return -1;

    char* buffer = (char*)malloc((size_t)size + 1);
    if (!buffer) return -1;

    va_start(args, format);
    vsnprintf(buffer, (size_t)size + 1, format, args);
    va_end(args);

#ifdef _WIN32
    int wlen = MultiByteToWideChar(CP_UTF8, 0, buffer, -1, NULL, 0);
    if (wlen <= 0) {
        fwrite(buffer, 1, size, stdout);
        free(buffer);
        return size;
    }
    wchar_t* wide = (wchar_t*)malloc((size_t)wlen * sizeof(wchar_t));
    if (!wide) {
        free(buffer);
        return -1;
    }
    MultiByteToWideChar(CP_UTF8, 0, buffer, -1, wide, wlen);

    HANDLE handle = GetStdHandle(STD_OUTPUT_HANDLE);
    int result = 0;
    if (is_console_handle(handle)) {
        DWORD written = 0;
        if (WriteConsoleW(handle, wide, (DWORD)(wlen - 1), &written, NULL)) {
            result = (int)written;
        } else {
            result = fwrite(buffer, 1, size, stdout);
        }
    } else {
        result = fwrite(buffer, 1, size, stdout);
    }

    free(wide);
    free(buffer);
    return result;
#else
    int ret = fputs(buffer, stdout);
    free(buffer);
    return ret;
#endif
}

/**
 * @brief 设置控制台编码，确保输出可正确显示中文内容。
 */
void set_console_encoding(void) {
#ifdef _WIN32
    SetConsoleOutputCP(CP_UTF8);
    SetConsoleCP(CP_UTF8);
    system("chcp 65001 > nul");
    if (setlocale(LC_ALL, ".UTF-8") == NULL) {
        if (setlocale(LC_ALL, ".UTF8") == NULL) {
            setlocale(LC_ALL, "Chinese-simplified");
        }
    }
#else
    setlocale(LC_ALL, "");
#endif
}
