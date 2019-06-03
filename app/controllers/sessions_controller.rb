class SessionsController < ApplicationController

  def index
    redirect_to sessions_new_path
  end

  def new
    flash[:error] = []
    render :new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dogs_path
    else
      flash[:error] = "INVALID LOGIN"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to "/sessions/new"
  end

end
