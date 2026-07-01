#ifndef CLI_INTERFACE_H
#define CLI_INTERFACE_H

#include "record_system.h"

void PrintMenu(void);
int RunCli(RecordDatabase *db, const char *default_path);

#endif // CLI_INTERFACE_H
