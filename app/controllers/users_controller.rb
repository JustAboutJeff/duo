class UsersController < ApplicationController

  def index
    @user = User.new
    @users = User.all
    @teams = Team.all
  end

  def show
    @user = User.find(params[:id])
    @teams = @user.teams
  end

  def new
    @user = User.new
  end

  def build
    @user = User.new(params[:user])
    if @user.save
      DuoMailer.duo_notify(@user).deliver
      redirect_to users_path, notice: "User created!"
    else
      render 'index'
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      DuoMailer.duo_notify(@user).deliver
      session[:user_id] = @user.id
      redirect_to user_path(current_user), notice: "User created!"
    else
      render 'new'
    end
  end

  def destroy
    if session[:user_id] == params[:id].to_i
      session[:user_id] = nil
      User.destroy(params[:id])
      redirect_to root_path, alert: "User deleted!"
    else
      User.destroy(params[:id])
      redirect_to users_path, notice: "User deleted!"
    end
  end
end