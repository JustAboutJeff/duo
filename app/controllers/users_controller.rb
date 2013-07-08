class UsersController < ApplicationController

  # GET /users
  def index
    @user = User.new
    @users = User.all
    @teams = Team.all
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    @teams = @user.teams
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users/build
  def build
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, notice: "User created!"
    else
      render 'index'
    end
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(current_user), notice: "User created!"
    else
      render 'new'
    end
  end

  # DELETE /users/:id
  def destroy
    if session[:user_id] == params[:id].to_i
      session[:user_id] = nil
      User.destroy(params[:id])
      redirect_to root_path, alert: "User deleted!"
    else
      User.destroy(params[:id])
      redirect_to users_path, alert: "User deleted!"
    end
  end
end