require "test_helper"

describe TransactionsController do

  context "without login" do
    it "index" do
      get :index
      assert_redirected_to new_session_path
    end
  end

  # Please note that the login-method can be put in a before-each loop. This is not done, because it was called also for the other context
  context "with login" do
    it "index" do
      login_for_controller_tests User.where(email: "jeroeningen@gmail.com").first
      get :index
      assert_template "index"
    end
  end
end