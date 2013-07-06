class TeamsController < ApplicationController

  def index
    @teams = Team.all
    @team = Team.new
    @users = User.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to user_path(current_user), notice: "Team created!"
    else
      render 'new'
    end
  end

  def destroy
    Team.destroy(params[:id])
    redirect_to user_path(current_user), notice: "Team deleted!"
  end
end