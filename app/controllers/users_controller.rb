class UsersController < ApplicationController

  def index
    unless logged_in?
      redirect_to "users/new"
    end
  end

  def new
    flash[:error] = []
    @user = User.new
    render :new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      current_user
      logged_in?
      redirect_to user_path(@user)
    else
      flash[:error]= @user.errors.full_messages
      render :new
    end
  end

  def edit
    flash[:error] = []
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id]).delete
    session.delete :user_id
    redirect_to new_user_path
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
