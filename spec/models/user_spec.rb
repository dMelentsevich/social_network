require "rails_helper"

RSpec.describe User, type: :model  do
  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { should define_enum_for(:sex).with(%i[male female]) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it "should be valid with email and password" do
    user = User.new(
      email: "adcf@example.com",
      password: "123123")
     expect(user).to be_valid
  end
end
