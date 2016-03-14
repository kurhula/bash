#!/usr/bin/env bash

# basht macro, shellcheck fix
export T_fail

# shellcheck disable=SC1091
. test/test_helpers

# shellcheck disable=SC1091
. lib/fizzbuzz.bash

T_is_factor_of_TrueWhenDividesEqually() {
  is_factor_of 3 3 ||
  $T_fail "Expected to be true when it divides equally"
}

T_is_factor_of_FalseWhenDoesNotDivideEqually() {
  ! is_factor_of 3 5 ||
  $T_fail "Expected to be false when it does not divide equally"
}

T_is_factor_of_FailsWhenNoFirstArgument() {
  expect_to_contain "$(is_factor_of 2>&1)" "first argument is what we divide" ||
  $T_fail
}

T_is_factor_of_FailsWhenNoSecondArgument() {
  expect_to_contain "$(is_factor_of 1 2>&1)" "second argument is what we divide by" ||
  $T_fail
}
