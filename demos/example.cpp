#include <iostream>

static int MAX_VAL = 1000;

int new_function(int arg) {
  // please fix the goofy naming scheme
  if (arg > MAX_VAL || arg == 0)
    return arg;
  return new_function(arg + 1);
}

int main() {

  int a = 0;
  std::cout << "Hello world!\n";
  std::cout << new_function(a);
  return 0;
}
