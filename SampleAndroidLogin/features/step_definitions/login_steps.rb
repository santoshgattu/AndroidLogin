Given(/^I have launched the app$/)do
  @login_page = $ENV::LoginPage.new($driver)
  @login_page.vrfyapplaunched
end

And /^I click "([^\"]*)" button$/ do |buttontoclick|
  @login_page.clickappbutton(buttontoclick)
end

Then /^I see "([^\"]*)" text on screen$/ do |texttoverify|
  @login_page.vrfytextdisplayed(texttoverify)
end

When /^I enter text "([^\"]*)" on Test page$/ do
  @login_page.enterrandomtext
end

Then /^I am navigated to "([^\"]*)" page$/ do |pagetitle|
  @login_page.verifynavpagetitle(pagetitle)
end

And /^I verify text entered by user above is displayed successfully$/ do
  @login_page.verifytextdisplayedonnextpage
end