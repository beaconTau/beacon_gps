/* usbreset -- send a USB port reset to a USB device */

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <linux/usbdevice_fs.h>

int main(int nargs, char **args)
{
    char filename[128]; 

    if (nargs < 3) {
        fprintf(stderr, "Usage: usbreset bus device\n");
        return 1;
    }
    int bus = atoi(args[1]); 
    int device = atoi(args[2]); 
    sprintf(filename,"/dev/bus/usb/%03d/%03d", bus, device);


    int fd = open(filename, O_WRONLY);
    if (fd < 0) {
        fprintf(stderr,"Error opening %s, maybe you don't have permissions, or maybe device %d-%d doesn't exist\n", filename, bus,device);
        return 1;
    }

    printf("Resetting USB device %d-%d (%s)\n", bus,device, filename);
    int rc = ioctl(fd, USBDEVFS_RESET, 0);
    if (rc < 0) {
	int err = errno; 
        fprintf(stderr,"Error %d in ioctl: %s\n",err, strerror(err));
        return 1;
    }
    printf("Reset successful\n");

    close(fd);
    return 0;
}
