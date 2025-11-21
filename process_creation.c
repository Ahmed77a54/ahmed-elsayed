/* Demonstration of Process Duplication using fork() System Call */
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main(void) {
    pid_t process_id;
    
    // Create a duplicate process
    process_id = fork();
    
    if (process_id < 0) {
        // Fork operation unsuccessful
        fprintf(stderr, "Error: Process creation failed!\n");
        return 1;
    } 
    else if (process_id == 0) {
        // Child process execution block
        printf("Child Process Running | Process ID: %d\n", getpid());
    } 
    else {
        // Parent process execution block
        printf("Parent Process Running | Process ID: %d\n", getpid());
    }
    
    return 0;
}
