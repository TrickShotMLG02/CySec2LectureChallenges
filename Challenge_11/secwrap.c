#define _GNU_SOURCE
#include <unistd.h>

int main(int argc, char* argv[], char *envp[]) {
  if(argc <= 1) return -1;
  char* cmd = argv[1];
  for(int i = 1; i < argc; ++i) argv[i - 1] = argv[i];
  argv[argc - 1] = 0;
  execvpe(cmd, argv, envp);
  return 0;
}
