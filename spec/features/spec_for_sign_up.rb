require "rails_helper"

RSpec.describe "Spec for Sign Up" do
	it "should create new user account" do
		visit new_user_registration_path
		email = "abcd@example.com"
		fill_in 'user_email', :with => email
		fill_in 'user_password', :with => "123123"
		fill_in 'user_password_confirmation', :with => "123123"
		click_button 'Sign up'
		expect(page).to have_content "Signed up successfully." 
  end	
end