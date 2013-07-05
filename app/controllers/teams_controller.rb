class TeamsController < ApplicationController
  before_filter :authorize

  def index
    @teams = Team.order("created_at DESC")
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
      @team = Team.new
    else
      redirect_to root_path
    end
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to user_path(current_user)
    else
      render 'new', notice: "Team created!"
    end
  end

  def destroy
    Team.destroy(params[:id])
    redirect_to root_path
  end
end