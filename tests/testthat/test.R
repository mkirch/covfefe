testthat::test_that("covfefefy produces proper results",{
  testthat::expect_equal(covfefy("coverage"),"covfefe")
  testthat::expect_equal(covfefy("example"),"exxaxa")
  testthat::expect_equal(covfefy("programming"),"progkaka")
  testthat::expect_equal(covfefy("president"),"preszizi")
})
