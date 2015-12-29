require "test_helper"

describe UsersController do

  context "without login" do
    it "create" do
      post :create
      assert_redirected_to new_session_path
    end
  end

  # Please note that the login-method can be put in a before-each loop. This is not done, because it was called also for the other context
  context "with login" do
    it "create" do
      login_for_controller_tests User.where(email: "jeroeningen@gmail.com").first
      post :create, user: {deposit: "70.21"}
      assert_redirected_to root_path
    end
    it "create" do
      login_for_controller_tests User.where(email: "jeroeningen@gmail.com").first
      @jan = User.where(email: "jandevries@gmail.com").first
      post :create, user: {transfer_money: {bank_account_id: @jan.bankaccount.id, amount: "70.21"}}
      assert_redirected_to root_path
    end
  end
end
