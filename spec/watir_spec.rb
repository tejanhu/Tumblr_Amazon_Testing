require 'spec_helper.rb'

describe "Navigate to the tumblr website" do
  it "should navigate to the tumblr website and login" do
    browser = Watir::Browser.new :firefox
    browser.goto "http://tumblr.com/login"

    browser.driver.manage.timeouts.implicit_wait = 10

    # click the next button
    browser.button(id: "signup_forms_submit").click

    browser.text_field(:id => "signup_determine_email").set "tejanahmedhu@gmail.com\n"

    browser.text_field(id: "signup_determine_email")
    # wait for the password field to be present
    browser.element(:id => "signup_password").present?

    browser.text_field(:id => "signup_password")
    browser.text_field(id: "signup_password").set "123456pass"

    # click the log in button
    browser.button(id: "signup_forms_submit")
    browser.button(id: "signup_forms_submit").click

    puts "Page title is #{browser.title}"
    browser.quit
  end


end
