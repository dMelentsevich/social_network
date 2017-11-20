require "rails_helper"

RSpec.describe User, :type => :model  do
  it "should be valid with email and password" do
    user = User.new(
      email: "user@example.com",
      password: "123123")
     expect(user).to be_valid
  end
end
