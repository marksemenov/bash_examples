#define LEN 2
#define TOTAL 8192

int main()
{
    char yes[LEN] = {'y', '\n'};
    char *buf = malloc(TOTAL);
    int bufused = 0;
    while (bufused < TOTAL) {
        memcpy(buf+bufused, yes, LEN);
        bufused += LEN;
    }
    while(write(1, buf, TOTAL));
    return 1;
}