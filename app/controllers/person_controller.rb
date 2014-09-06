class PersonController < ApplicationController
  def index
    @people = Person.all
    render 'people/index'
  end

  def new
    @person = Person.new
    render 'people/new'
  end

  def show
    @person = Person.find params[:id]
    render 'people/show'
  end

  def create
    @person = Person.create name: params[:name],
                          specialty: params[:specialty],
                          email: params[:email]
    if @person.save
      render 'people/success'
    else
      render 'people/new'
    end
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
      render 'people/success'
    else
      render 'people/edit'
    end
  end
end
