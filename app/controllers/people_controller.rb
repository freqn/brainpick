class PeopleController < ApplicationController
  def index
    @people = Person.all
    render 'index'
  end

  def new
    @person = Person.new
    render 'new'
  end

  def create
    @person = Person.create(person_params)
    if @person.save
      redirect_to people_path
    else
      render 'new'
    end
  end

  def show
    @person = Person.find params[:id]
    render 'show'
  end

  def edit
    @person = Person.find(params[:id])
    render 'edit'
  end

  def update
    @person = Person.find(params[:id])
    if @person.update person_params
      redirect_to people_path
    else
      render 'index'
    end
  end

  def destroy
    @person = Person.find params[:id]
    @person.destroy!
    if Person.count < 1
      Person.reset_pk_sequence
    end
    redirect_to people_path
  end

  private

  def person_params
    params.require(:person).permit(:name, :specialty, :email)
  end

end
