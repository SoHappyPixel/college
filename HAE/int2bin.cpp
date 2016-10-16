#include <stdio.h>      /* printf */
#include <string.h>     /* strcat */
#include <stdlib.h>     /* strtol */

const char* byte_to_binary(int x)
{
    static char b[9]; b[0] = '\0';

    for (int z = 128; z > 0; z >>= 1)
    { strcat(b, ((x & z) == z) ? "1" : "0"); }

    return b;
}

int main(void)
{

	int z = 0xA3;
	int beta = ~z;
	int alfa = !beta;
	int gamma= (z >> 2);

	printf("%s\n", byte_to_binary(z));
	printf("%s\n", byte_to_binary(beta));
	printf("%s\n", byte_to_binary(alfa));
	printf("%s\n", byte_to_binary(gamma));

    return 0;
}