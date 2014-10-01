class PersonController < ApplicationController
  def index
    @people = Person.all
    render 'people/index'
  end

  def new
    @person = Person.new
    render 'people/new'
  end

  def create
    @person = Person.create name: params[:name],
                          specialty: params[:specialty],
                          email: params[:email]
    if @person.save
      redirect_to '/people/'
    else
      render 'people/new'
    end
  end
  
  def show
    @person = Person.find params[:id]
    render 'people/show'
  end

  def edit
    @person = Person.find(params[:id])
    render 'people/edit'
  end

  def update
    @person = Person.find(params[:id])
    if @person.update name: params[:name],
                          specialty: params[:specialty],
                          email: params[:email]
      redirect_to '/people/'
    else
      render 'people/index'
    end
  end

  def destroy
    @person = Person.find params[:id]
    @person.destroy
    redirect_to '/people/'
  end
end
