#include <stdio.h>
#include <string.h>

unsigned char g_key[8] = {0x13, 0x37, 0x42, 0x99, 0xAB, 0x0D, 0x5E, 0x71};
unsigned char g_target[8] = {0x5E, 0x45, 0x13, 0xC6, 0xCD, 0x6E, 0x2B, 0x15};

int check_code(const char *in)
{
    unsigned char buf[8];
    int i;

    if (strlen(in) != 8)
        return 0;
    for (i = 0; i < 8; i++)
        buf[i] = (unsigned char)(in[i] ^ g_key[i]);
    return memcmp(buf, g_target, 8) == 0;
}

int main(int argc, char **argv)
{
    if (argc < 2) {
        puts("usage: sample <code>");
        return 2;
    }
    puts(check_code(argv[1]) ? "OK" : "DENIED");
    return 0;
}
