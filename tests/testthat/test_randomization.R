context("")
test_that("The randomization is", {
  set.seed(200)
  check <- sample(rep(0:1, c(60, 40)))
  set.seed(200)
  expect_equal(randomization(100, 100, c(3, 2)), check)
  set.seed(40555)
  expect_equal(sum(randomization(12, 10, c(3, 2)) == 1), 5)
  expect_error(randomization(20, 40, c(1, 4)))
  expect_error(randomization(100, 20, c(2, 1)))
})
