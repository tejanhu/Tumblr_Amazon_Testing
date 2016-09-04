require 'spec_helper.rb'
require 'pry'

describe "Navigate to the Amazon UK website" do

	# before(:all) do
  	browser = Watir::Browser.new :chrome
	browser.goto "http://amazon.co.uk/"

    browser.driver.manage.timeouts.implicit_wait = 10
  # end

	it "Search for OOP"do

		browser.text_field(:id => "twotabsearchtextbox").when_present.set("Object Oriented Programming")
		browser.input(:type => "submit").click
		# binding.pry
		browser.text_field(:id => "twotabsearchtextbox").when_present.set("Object Oriented Programming: Questions and Answers")
		browser.input(:type => "submit").click
		expect(browser.a(:title => "Object Oriented Programming: Questions and Answers").exists?).to eq true
		# binding.pry
		expect(browser.li(:id => "result_0").span(:class => "a-size-base a-color-price s-price a-text-bold").text) == "£10.30"

	end

	it "Print Search Results"do
		books = browser.lis(:id => "/result_\d+$/")
		books.each do |ting|
			puts ting.h2.text
			puts ting.span(:class => "a-size-base a-color-price s-price a-text-bold").text
		end
	end

end