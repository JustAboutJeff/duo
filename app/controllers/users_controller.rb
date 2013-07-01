class UsersController < ApplicationController

  def index
    @users = User.order("created_at DESC")
  end

  def show
    @user = User.find(params[:id])
    @teams = @user.teams
    @people = @user.people
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      # TODO: error handling
      # @errors = user.errors
      redirect_to new_user_path
    end
  end
end