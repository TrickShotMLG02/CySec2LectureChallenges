all: test.c
	gcc -fno-stack-protector -fno-omit-frame-pointer -m32 -O0 -g test.c -o test
	execstack -s test


clean:
	rm test
	
