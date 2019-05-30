class AdoptionsController < ApplicationController
  def index
    @adoptions = Adoptions.all
    render :index
  end

  def new
    @adoption = Adoption.new
  end

  def create
    @adoption = Adoption.create(adoption_params)
    @adoption.dog.status = "Adopted by #{@adoption.user.username}"
    @adoption.dog.save
    redirect_to dog_path(@adoption.dog)
  end

  private

  def adoption_params
    params.require(:adoption).permit(:user_id, :dog_id)
  end
  
end
