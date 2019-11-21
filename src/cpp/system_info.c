#include "system_info.h"
#define MAXSIZE 210
#include <unistd.h>

/* uname -m */
/* char* get_machine() */
/* { */
/*     static char machine [MAXSIZE]; */
/*     size_t len = sizeof(machine); */

/*     sysctl("hw.machine", 2, &machine, &len, NULL, 0); */
/*     return machine; */
/* } */

/* char* get_model() */
/* { */
/*     static char model[MAXSIZE]; */
/*     size_t len = sizeof(model); */

/*     sysctl("hw.model", 2, &model, &len, NULL, 0); */
/*     return model; */
/* } */

// cat /proc/meminfo | grep MemTotal
/* int64_t get_memory() */
/* { */
/*     int64_t mem; */
/*     size_t len = sizeof(mem); */

/*     sysctl("hw.memsize", 2, &mem, &len, NULL, 0); */
/*     return mem; */
/* } */

// nproc --all
int32_t get_ncpu()
{
    /* int32_t cpu; */
    /* size_t len = sizeof(cpu); */

    /* sysctl("hw.ncpu", 2, &cpu, &len, NULL, 0); */
    return sysconf(_SC_NPROCESSORS_ONLN);
}

 /* int32_t get_nlogicalcpu() */
/*  { */
/*     int32_t logical_cpu; */
/*     size_t len = sizeof(logical_cpu); */

/*     sysctl("hw.logicalcpu", 2, &logical_cpu, &len, NULL, 0); */
/*     return logical_cpu; */
/* } */

int main(int argc, char* argv[])
{
    //printf("%s, %s, %ld, %d, %d\n",
    printf("%d\n",
           //get_machine(),
           //get_model(),
           //get_memory(),
          get_ncpu());
           //get_nlogicalcpu());

    return 0;
}
