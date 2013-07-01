class TeamsController < ApplicationController

  def index
    @teams = Team.order("created_at DESC")
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    team = Team.new(params[:team])
    if team.save
      redirect_to root_path
    else
      # TODO: error handling
      # @errors = team.errors
      redirect_to new_user_team_path
    end
  end

  def destroy
    Team.destroy(params[:id])
    redirec_to root_path
  end

end