#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <pthread.h>

pthread_t t_led_on;
pthread_t t_led_off;


void* led_blink_on()
{
    int exportfd, directionfd;

    printf("[Info] UG1165 lab6 start running...5\n");

    // The GPIO has to be exported to be able to see it
    // in sysfs

    exportfd = open("/sys/class/gpio/export", O_WRONLY);
    if (exportfd < 0)
    {
        printf("[ERROR] Cannot open GPIO to export it\n");
        exit(1);
    }

    write(exportfd, "958", 4);
    write(exportfd, "959", 4);
    write(exportfd, "1022", 4);
    write(exportfd, "1023", 4);
    close(exportfd);

    printf("[Info] Init successfully\n");

    // Update the direction of the GPIO to be an output
    directionfd = open("/sys/class/gpio/gpio958/direction", O_RDWR);
    write(directionfd, "out", 4);
    directionfd = open("/sys/class/gpio/gpio959/direction", O_RDWR);
    write(directionfd, "out", 4);
    directionfd = open("/sys/class/gpio/gpio1022/direction", O_RDWR);
    write(directionfd, "out", 4);
    directionfd = open("/sys/class/gpio/gpio1023/direction", O_RDWR);
    write(directionfd, "out", 4);
    close(directionfd);

    //printf("GPIO direction set as output successfully\n");

    // Get the GPIO value ready to be toggled

    int valuefd_pl_led1 = open("/sys/class/gpio/gpio958/value", O_RDWR);
    int valuefd_pl_led2 = open("/sys/class/gpio/gpio959/value", O_RDWR);
    int valuefd_pl_led3 = open("/sys/class/gpio/gpio1022/value", O_RDWR);
    int valuefd_pl_led4 = open("/sys/class/gpio/gpio1023/value", O_RDWR);
    //printf("GPIO value opened, now toggling...\n");

    // toggle the GPIO as fast a possible forever, a control c is needed
    // to stop it
    
    printf("[Info] LED start blink...\n");
    while(1)
    {
        write(valuefd_pl_led1,"1", 2);
        write(valuefd_pl_led2,"1", 2);
        write(valuefd_pl_led3,"1", 2);
        write(valuefd_pl_led4,"1", 2);
        sleep(1);
        write(valuefd_pl_led1,"0", 2);
        write(valuefd_pl_led2,"0", 2);
        write(valuefd_pl_led3,"0", 2);
        write(valuefd_pl_led4,"0", 2);
        sleep(1);
    }
}

void* led_blink_off()
{
    int Choice;
    scanf("%d",&Choice);
    if (Choice == 0)
    {
    	pthread_exit(t_led_on);
        pthread_cancel(t_led_on);
    }
}


int main()
{
    printf("################################ \n\r");
    printf("      Blink LED Application  \n\r");
    printf("################################ \n\r");

    int Choice;
    int exitflag = 1;
    int led_now_on = 0;


    while (exitflag)
    {
        printf("************************************************ \n\r");
        printf("Press '1' to Start Blink LED TEST \n\r");
        printf("Press '0' to Stop Blink LED TEST \n\r");
        printf("************************************************ \n\r");
        scanf("%d",&Choice);
        printf("Choice:: %d \n\r", Choice);

        if (Choice == 1 && led_now_on == 0)
        {
            printf("[Info] LED Ready to blink...\n");
            led_now_on = 1;
        }

        if (Choice == 1 && led_now_on == 1)
        { 
            printf("[Info] pthread_create\n");
            pthread_create(&t_led_on, NULL, led_blink_on, NULL);
            pthread_create(&t_led_off, NULL, led_blink_off, NULL);

            pthread_join(t_led_on, NULL);
            pthread_join(t_led_off, NULL);
            exitflag = 1;
        }
        else if (Choice == 0 && led_now_on == 1)
        {
            printf("[Info] LED stop blink...\n");
            led_now_on = 0;
            pthread_exit(t_led_on);
            exitflag = 1;
        }

        if(Choice != 1 || Choice != 0)
        {
            exitflag = 0;
        }
    
    }

    // close(valuefd_pl_led1);
    // close(valuefd_pl_led2);
    // close(valuefd_pl_led3);
    // close(valuefd_pl_led4);
    printf("################################ \n\r");
    printf("      Bye Blink LED Application  \n\r");
    printf("################################ \n\r");
}
