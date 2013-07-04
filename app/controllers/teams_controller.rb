class TeamsController < ApplicationController

  def index
    @teams = Team.order("created_at DESC")
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    if logged_in?
      @team = Team.new
    else
      redirect_to root_path
    end
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    Team.destroy(params[:id])
    redirect_to root_path
  end
end