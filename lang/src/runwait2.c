#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <termios.h>

void enableRawMode(struct termios *orig_termios)
{
    struct termios raw = *orig_termios;
    raw.c_lflag &= ~(ECHO | ICANON);
    tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw);
}

void disableRawMode(struct termios *orig_termios)
{
    tcsetattr(STDIN_FILENO, TCSAFLUSH, orig_termios);
}

int main()
{
    pid_t pid = fork();

    if (pid == -1)
    {
        perror("fork");
        exit(EXIT_FAILURE);
    }
    else if (pid == 0)
    {
        execlp("ls", "ls", "-l", (char *)NULL);
        perror("execlp");
        exit(EXIT_FAILURE);
    }
    else
    {
        int status;
        waitpid(pid, &status, 0);

        struct termios orig_termios;
        tcgetattr(STDIN_FILENO, &orig_termios);
        enableRawMode(&orig_termios);

        printf("Press 'q', left arrow, or right arrow to exit.\n");

        char c;
        while (read(STDIN_FILENO, &c, 1) == 1 && c != 'q')
        {
            if (c == '\x1b')
            { // Escape character
                char seq[2];
                if (read(STDIN_FILENO, &seq[0], 1) == 1 && read(STDIN_FILENO, &seq[1], 1) == 1)
                {
                    if (seq[0] == '[' && (seq[1] == 'D' || seq[1] == 'C'))
                    {
                        break; // Left or Right Arrow
                    }
                }
            }
        }

        disableRawMode(&orig_termios);
        printf("Exiting...\n");
    }

    return 0;
}
