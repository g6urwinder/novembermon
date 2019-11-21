#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <sys/sysctl.h>
#ifndef __SYSTEM_INFO_H__
#define __SYSTEM_INFO_H__ "system_info.h"

#ifdef __cplusplus
extern "C" {
#endif
    char* get_machine();
    char* get_model();
    int64_t get_memory();
    int32_t get_ncpu();
    int32_t get_nlogicalcpu();

#ifdef __cplusplus
}
#endif
#endif
