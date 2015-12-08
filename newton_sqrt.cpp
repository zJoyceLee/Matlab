// STL
#include <limits>
// c-standard
#include <cassert>
#include <cmath>
#include <cstdio>
using std::abs;

double square(const double num) {
  return num * num;
}

double average(double lhs, const double rhs) {
  return (double)(lhs + rhs) / 2;
}

bool newton_sqrt_check(const double guess, const double base) {
  const double eps = 1e-16;
  return (abs(square(guess) - base) <= eps);
}

bool newton_guess_doesnt_improve(const double old_guess, const double new_guess) {
  const double eps = 1e-16;
  return (abs(old_guess - new_guess) <= eps);
}

double newton_sqrt_iter(const double guess, const double base) {
  if (newton_sqrt_check(guess, base))
    return guess;

  const double improved_guess = average(guess, base/guess);
  if (newton_guess_doesnt_improve(guess, improved_guess))
    return guess;
  return newton_sqrt_iter(improved_guess, base);
}

double newton_sqrt(const double base) {
  return newton_sqrt_iter(1, base);
}

int main() {
  const double eps = 1e-8;
  for (int i = 0; i < 20480; ++i) {
    printf("%d: %lf %lf\n", i, newton_sqrt(i), sqrt(i));
    assert(newton_sqrt(i) - sqrt(i) <= eps);
  }

  return 0;
}

