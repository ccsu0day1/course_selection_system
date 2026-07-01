#ifndef PERFORMANCE_H
#define PERFORMANCE_H

#include "common.h"

void run_performance_comparison(const char* files[]);
void stat_course_enrollment(const DataContainer* container, const DataInterface* iface, int capacity);
void stat_student_credits(const DataContainer* container, const DataInterface* iface);
void stat_college_distribution(const DataContainer* container, const DataInterface* iface);
void stat_semester_trend(const DataContainer* container, const DataInterface* iface);
void stat_score_distribution(const DataContainer* container, const DataInterface* iface);

#endif
