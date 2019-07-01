#include "camera_test.h"
#include "can_test.h"
#include "gpio_test.h"
#include "menu.h"
#include "network_test.h"

int main() {
    camera_test();
    can_test();
    gpio_test();
    network_test();
}
