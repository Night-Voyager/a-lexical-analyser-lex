#include <stdio.h>

void test(const char *, ...);

int main() {
	// single line comment
	char c = '';
	char d = '\n';
	printf("%d", 037ul + 08 + 0xbcDL + 0XEfA + 1ul + 0L + 0.0 + 1. + .2 + 1e-1l);
	/*
	 * multi line comment
	 */
	return 0;
}
