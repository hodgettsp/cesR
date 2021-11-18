context("get_ces")

test_that("get_ces produces a data object from the requested dataset",{

  # User requests the 2019 CES online survey
  cesR::get_ces("ces2019_web")
  expect_true(exists("ces2019_web"))

  # User requests the 2019 CES phone survey
  cesR::get_ces("ces2019_phone")
  expect_true(exists("ces2019_phone"))

  # User requests 2015 CES online survey
  cesR::get_ces("ces2015_web")
  expect_true(exists("ces2015_web"))

  # User requests 2015 CES phone survey
  cesR::get_ces("ces2015_phone")
  expect_true(exists("ces2015_phone"))

  # User requests 2015 CES combined survey
  cesR::get_ces("ces2015_combo")
  expect_true(exists("ces2015_combo"))

  # User requests CES 2011 survey
  cesR::get_ces("ces2011")
  expect_true(exists("ces2011"))

  # User requests CES 2008 survey
  cesR::get_ces("ces2008")
  expect_true(exists("ces2008"))

  cesR::get_ces("ces2004")
  expect_true(exists("ces2004"))

  cesR::get_ces("ces0411")
  expect_true(exists("ces0411"))

  cesR::get_ces("ces0406")
  expect_true(exists("ces0406"))

  cesR::get_ces("ces2000")
  expect_true(exists("ces2000"))

  cesR::get_ces("ces1997")
  expect_true(exists("ces1997"))

  cesR::get_ces("ces1993")
  expect_true(exists("ces1993"))

  cesR::get_ces("ces1988")
  expect_true(exists("ces1988"))

  cesR::get_ces("ces1984")
  expect_true(exists("ces1984"))

  cesR::get_ces("ces1974")
  expect_true(exists("ces1974"))

  cesR::get_ces("ces7480")
  expect_true(exists("ces7480"))

  cesR::get_ces("ces72_jnjl")
  expect_true(exists("ces72_jnjl"))

  cesR::get_ces("ces72_sep")
  expect_true(exists("ces72_sep"))

  cesR::get_ces("ces72_nov")
  expect_true(exists("ces72_nov"))

  cesR::get_ces("ces1968")
  expect_true(exists("ces1968"))

  cesR::get_ces("ces1965")
  expect_true(exists("ces1965"))
})
