class UsersController < ApplicationController
  def create
    flash[:info] = case
      when params[:user][:deposit].present? then current_user.deposit params[:user][:deposit]
      when params[:user][:transfer_money].present? then current_user.transfer_money params[:user][:transfer_money][:bankaccount_id], params[:user][:transfer_money][:amount]
    end
    redirect_to root_path
  end
end
