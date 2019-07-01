#include "network_test.h"
#include "menu.h"
#include <stdio.h>

int network_test() {
    printf("%s\n", NETWORK_STRING);
    printf("network invoke menu.\n");
    imenu();
    return 0;
}
