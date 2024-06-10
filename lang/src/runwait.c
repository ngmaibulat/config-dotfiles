#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main()
{
    pid_t pid = fork();

    if (pid == -1)
    {
        // Error handling: fork() failed
        perror("fork");
        exit(EXIT_FAILURE);
    }
    else if (pid == 0)
    {
        // Child process
        // Replace "ls" and its arguments with the program you want to run
        execlp("ls", "ls", "-l", (char *)NULL);
        // If execlp returns, it must have failed
        perror("execlp");
        exit(EXIT_FAILURE);
    }
    else
    {
        // Parent process
        // Wait for the child process to complete
        int status;
        waitpid(pid, &status, 0);

        // After the child process, wait for a single character input
        printf("Enter a character to continue: ");
        char c;
        scanf(" %c", &c); // Space before %c to skip any whitespace characters

        printf("You entered: %c\n", c);
    }

    return 0;
}
