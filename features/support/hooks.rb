################################################################################
### This file contains any code that should be executed before and after     ###
### the acceptance tests are run, this could include things like taking a    ###
### screenshot if a scenario fails or getting through any initial            ###
### authentication for the app before running the tests.                     ###
################################################################################
After do |scenario|
  save_screenshot("sshot-#{Time.new.to_i}.png", full: true) if scenario.failed?
end
