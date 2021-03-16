#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

void create_file_with_hole(void)
{
    int fd = open("file.hole", O_WRONLY|O_TRUNC|O_CREAT, 0600);
    write(fd, "Hello", 5);
    lseek(fd, 999880, SEEK_CUR); // Make a hole
    lseek(fd, 999880, SEEK_CUR); // Make a hole
    lseek(fd, 999880, SEEK_CUR); // Make a hole
    write(fd, "Goodbye", 7);
    close(fd);
}

void create_file_without_hole(void)
{
    int fd = open("file.nohole", O_WRONLY|O_TRUNC|O_CREAT, 0600);
    write(fd, "Hello", 5);
    char buf[999880];
    memset(buf, 'a', 999880);
    write(fd, buf, 999880); // Write lots of bytes
    write(fd, buf, 999880); // Write lots of bytes
    write(fd, buf, 999880); // Write lots of bytes
    write(fd, "Goodbye", 7);
    close(fd);
}

int main()
{
    create_file_with_hole();
    create_file_without_hole();
    return 0;
}
