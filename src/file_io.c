#include "file_io.h"
#include "record_system.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void strip_utf8_bom(char *line) {
    if (line[0] == (char)0xEF && line[1] == (char)0xBB && line[2] == (char)0xBF) {
        memmove(line, line + 3, strlen(line + 3) + 1);
    }
}

static bool parse_csv_line(char *line, SelectionRecord *record) {
    char *fields[9] = {0};
    char *token = strtok(line, ",");
    int index = 0;

    while (token != NULL && index < 9) {
        fields[index++] = token;
        token = strtok(NULL, ",");
    }

    if (index != 9) {
        return false;
    }

    strncpy(record->student_id, fields[0], sizeof(record->student_id) - 1);
    strncpy(record->name, fields[1], sizeof(record->name) - 1);
    strncpy(record->college, fields[2], sizeof(record->college) - 1);
    strncpy(record->course_id, fields[3], sizeof(record->course_id) - 1);
    strncpy(record->course_name, fields[4], sizeof(record->course_name) - 1);
    record->credit = (float)atof(fields[5]);
    strncpy(record->semester, fields[6], sizeof(record->semester) - 1);
    strncpy(record->selected_date, fields[7], sizeof(record->selected_date) - 1);
    record->score = atoi(fields[8]);

    record->student_id[sizeof(record->student_id) - 1] = '\0';
    record->name[sizeof(record->name) - 1] = '\0';
    record->college[sizeof(record->college) - 1] = '\0';
    record->course_id[sizeof(record->course_id) - 1] = '\0';
    record->course_name[sizeof(record->course_name) - 1] = '\0';
    record->semester[sizeof(record->semester) - 1] = '\0';
    record->selected_date[sizeof(record->selected_date) - 1] = '\0';
    return true;
}

bool load_from_csv(RecordDatabase *db, const char *path) {
    if (!db || !path) {
        return false;
    }

    FILE *file = fopen(path, "r");
    if (!file) {
        return false;
    }

    char line[1024];
    int loaded = 0;
    while (fgets(line, sizeof(line), file)) {
        strip_utf8_bom(line);
        if (line[0] == '\n' || line[0] == '\r' || line[0] == '\0') {
            continue;
        }
        char buffer[1024];
        strncpy(buffer, line, sizeof(buffer) - 1);
        buffer[sizeof(buffer) - 1] = '\0';

        SelectionRecord record = {0};
        if (!parse_csv_line(buffer, &record)) {
            continue;
        }
        if (InsertRecord(db, &record)) {
            loaded++;
        }
    }

    fclose(file);
    return true;
}

bool save_to_csv(const RecordDatabase *db, const char *path) {
    if (!db || !path) {
        return false;
    }

    FILE *file = fopen(path, "w");
    if (!file) {
        return false;
    }

    for (int i = 0; i < db->count; ++i) {
        const SelectionRecord *record = &db->records[i];
        fprintf(file, "%s,%s,%s,%s,%s,%.1f,%s,%s,%d\n",
                record->student_id,
                record->name,
                record->college,
                record->course_id,
                record->course_name,
                record->credit,
                record->semester,
                record->selected_date,
                record->score);
    }

    fclose(file);
    return true;
}
