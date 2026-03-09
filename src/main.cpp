#include <iostream>

#include "project/tmp.hpp"

int main()
{
  const int left = 2;
  const int right = 3;
  const int sum = tmp::add(left, right);

  std::cout << left << " + " << right << " = " << sum << '\n';
  return 0;
}
