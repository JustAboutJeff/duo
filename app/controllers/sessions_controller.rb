class SessionsController < ApplicationController

  # POST /signin
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Logged in!"
    else
      render 'new'
    end
  end

  # DELETE /signout
  def destroy
    session[:user_id] = nil
    redirect_to root_path, alert: "Logged out!"
  end
end