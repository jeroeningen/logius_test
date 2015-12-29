require "test_helper"

describe SessionsController do

  context "new session" do
    it "new" do
      get :new
      assert_template :new
    end
  end

  context "create a session" do
    before(:each) do
      @jeroen = User.where(email: "jeroeningen@gmail.com").first
    end
    it "fails to log in" do
      post :create, user: {email: @jeroen.email, password: "12345"}
      assert_redirected_to new_session_path
    end
    it "logging in successful" do
      post :create, user: {email: @jeroen.email, password: "123456", password_confimation: "123456"}
      assert_redirected_to root_path
    end
    it "logout" do
      login_for_controller_tests @jeroen
      get :destroy
      assert_redirected_to new_session_path
      assert_equal true, request.session[:user_id].blank?
    end
  end
end
