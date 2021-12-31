#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>


// The specific GPIO being used must be setup and replaced thru
// this code.  The GPIO of 897 is in the path of most the sys dirs
// and in the export write.
//
// Figuring out the exact GPIO was not totally obvious when there
// were multiple GPIOs in the system. One way to do is to go into
// the gpiochips in /sys/class/gpio and view the label as it should
// reflect the address of the GPIO in the system. The name of the
// the chip appears to be the 1st GPIO of the controller.
//
// The export causes the gpio897 dir to appear in /sys/class/gpio.
// Then the direction and value can be changed by writing to them.

// The performance of this is pretty good, using a nfs mount,
// running on open source linux, 
// the GPIO can be toggled about every 1sec.
// The following commands from the console setup the GPIO to be
// exported, set the direction of it to an output and write a 1
// to the GPIO.
//
// bash> echo 897 > /sys/class/gpio/export
// bash> echo out > /sys/class/gpio/gpio897/direction
// bash> echo 1 > /sys/class/gpio/gpio897/value

// if sysfs is not mounted on your system, the you need to mount it
// bash> mount -t sysfs sysfs /sys

// the following bash script to toggle the gpio is also handy for
// testing
//
// while [ 1 ]; do
//  echo 1 > /sys/class/gpio/gpio897/value
//  echo 0 > /sys/class/gpio/gpio897/value
// done

// to compile this, use the following command
// gcc gpio.c -o gpio

// The kernel needs the following configuration to make this work.
//
// CONFIG_GPIO_SYSFS=y
// CONFIG_SYSFS=y
// CONFIG_EXPERIMENTAL=y
// CONFIG_GPIO_XILINX=y

int main()
{
    int valuefd, exportfd, directionfd;

    printf("GPIO test running...\n");

    // The GPIO has to be exported to be able to see it
    // in sysfs

    exportfd = open("/sys/class/gpio/export", O_WRONLY);
    if (exportfd < 0)
    {
        printf("Cannot open GPIO to export it\n");
        exit(1);
    }

    write(exportfd, "958", 4);
    close(exportfd);

    printf("GPIO exported successfully\n");

    // Update the direction of the GPIO to be an output

    directionfd = open("/sys/class/gpio/gpio958/direction", O_RDWR);
    if (directionfd < 0)
    {
        printf("Cannot open GPIO direction it\n");
        exit(1);
    }

    write(directionfd, "out", 4);
    close(directionfd);

    printf("GPIO direction set as output successfully\n");

    // Get the GPIO value ready to be toggled

    valuefd = open("/sys/class/gpio/gpio958/value", O_RDWR);
    if (valuefd < 0)
    {
        printf("Cannot open GPIO value\n");
        exit(1);
    }

    printf("GPIO value opened, now toggling...\n");

    // toggle the GPIO as fast a possible forever, a control c is needed
    // to stop it

    while (1)
    {
        write(valuefd,"1", 2);
        sleep(1);
        write(valuefd,"0", 2);
        sleep(1);       
    }
}
