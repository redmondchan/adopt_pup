class DogsController < ApplicationController
  before_action :authorized

  def index
    if params[:search]
      @dogs = Dog.where('breed LIKE ?', "%#{params[:search].capitalize}%")
    else
      @dogs = Dog.all
    end
  end

  def show
    @adoption= Adoption.new
    @dog = Dog.find(params[:id])
    render :show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    redirect_to dog_path(@dog)
  end

  def edit
    @dog = Dog.find(params[:id])
    render :edit
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  private

  def dog_params
    params.require(:dog).permit(:location, :name, :breed, :status, :image_url, :search)
  end
  
end
