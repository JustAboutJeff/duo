class TeamsController < ApplicationController

  # GET /teams
  def index
    @teams = Team.all
    @team = Team.new
    @users = User.all
  end

  # POST /teams
  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to teams_path, notice: "Team created!"
    else
      render 'index'
    end
  end

  # POST /teams/:id/repopulate
  def repopulate
    @team = Team.find_by_id(params[:id])
    @users = User.where(id: params[:users])
    @team.users.clear
    @team.users << @users
    redirect_to teams_path, notice: "Team updated!"
  end

  # DELETE /teams/:id
  def destroy
    Team.destroy(params[:id])
    redirect_to teams_path, alert: "Team deleted!"
  end
end