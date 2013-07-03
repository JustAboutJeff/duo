class PeopleController < ApplicationController

  def index
    @people = Person.order("created_at DESC")
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    if logged_in?
      @person = Person.new
    else
      redirect_to root_path
    end
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    Person.destroy(params[:id])
    redirect_to root_path
  end
end