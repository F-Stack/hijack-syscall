#ifndef __F_STACK_SYSCALL_H__
#define __F_STACK_SYSCALL_H__

int socket_raw(int family, int type, int protocol);
int fepoll_create(int size);

int set_fd_start(int fdstart);

#endif
 
