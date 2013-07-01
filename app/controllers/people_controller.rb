class PeopleController < ApplicationController

  def index
    @people = Person.order("created_at DESC")
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @user = current_user
    @person = Person.new
  end

  def create
    person = Person.new(params[:person])
    if person.save
      redirect_to root_path
    else
      # TODO: error handling
      # @errors = person.errors
      redirect_to new_user_person_path
    end
  end

  def destroy
    Person.destroy(params[:id])
    redirect_to root_path
  end

end