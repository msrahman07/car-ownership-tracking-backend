class PersonsController < ApplicationController
  def index
    @persons = Person.all
    render json: @persons
  end

  def show
    @person = Person.find(params[:id])
    render json: @person
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if(@person.save)
      render json: @person
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @person = Person.find(params[:id])
    if(@person.update(person_params))
      render json: @person
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person = Person.find(params[:id])
    
    if(@person.destroy)
      render json: {status:"deleted"}
    else
      render json: {status:"unsuccessful"}
    end
    
  end

  private
    def person_params
      params.require(:person).permit(:first_name, :last_name, :email)
    end 
end
