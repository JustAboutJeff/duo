class UsersController < ApplicationController
  before_filter :authorized?, :except => [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @teams = @user.teams
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      DuoMailer.duo_notify(@user).deliver
      session[:user_id] = @user.id
      redirect_to root_path, notice: "User created!"
    else
      render 'new'
    end
  end
end