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
      redirect_to teams_path, notice: "Team created!"
    else
      render 'index'
    end
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes
    redirect to teams_path, notice: "Team updated!"
  end

  def destroy
    Team.destroy(params[:id])
    redirect_to teams_path, notice: "Team deleted!"
  end
end