require 'rails_helper'
 
RSpec.describe Users::OmniauthCallbacksController, :type => :controller do
  describe "#logged in user" do
    context "when user don't have facebook authentication" do
      before(:each) do
        stub_env_for_omniauth
 
        user = User.create!(:email => "user@example.com", :password => "my_secret")
        sign_in user
 
        get :facebook
      end
 
      it "should add facebook authentication to current user" do
        user = User.where(:email => "user@example.com").first
        user.should_not be_nil
        fb_authentication = user.authentications.where(:provider => "facebook").first
        fb_authentication.should_not be_nil
        fb_authentication.uid.should == "1234"
      end
 
      it { should be_user_signed_in }
 
      it { response.should redirect_to authentications_path }
       
      it { flash[:notice].should == "Facebook is connected with your account."}
    end  
end
end

def stub_env_for_omniauth
  # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
  request.env["devise.mapping"] = Devise.mappings[:user]
  env = { "omniauth.auth" => { "provider" => "facebook", "uid" => "1234", "extra" => { "user_hash" => { "email" => "ghost@nobody.com" } } } }
  @controller.stub!(:env).and_return(env)
end