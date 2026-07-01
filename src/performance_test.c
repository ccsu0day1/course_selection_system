#include "performance_test.h"
#include "file_io.h"
#include "record_system.h"
#include <stdio.h>
#include <time.h>

static double measure_load_time(const char *path, RecordDatabase *db) {
    clock_t start = clock();
    load_from_csv(db, path);
    clock_t end = clock();
    return (double)(end - start) / CLOCKS_PER_SEC;
}

static int safe_file_exists(const char *path) {
    FILE *file = fopen(path, "r");
    if (!file) {
        return 0;
    }
    fclose(file);
    return 1;
}

void run_performance_comparison(const char *files[]) {
    for (int i = 0; i < 3; ++i) {
        if (!safe_file_exists(files[i])) {
            printf("跳过不存在文件：%s\n", files[i]);
            continue;
        }

        RecordDatabase db;
        RecordDatabaseInit(&db);

        double total_time = measure_load_time(files[i], &db);
        printf("%s 加载耗时：%.6f 秒，记录数：%d\n", files[i], total_time, db.count);

        RecordDatabaseFree(&db);
    }
}
