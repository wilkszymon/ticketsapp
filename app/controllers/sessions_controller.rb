class SessionsController < ApplicationController
  def new

  end

  def create
      user = User.find_by(username: params[:session][:username].downcase)
      if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:notice] = "Welcome #{user.username}"
          redirect_to tickets_path
      else
          flash.now[:notice] = "There was something wrong with you login"
          render 'new'
      end
  end

  def destroy
      session[:user_id] = nil
      flash[:notice] = "Logged out"
      redirect_to root_path
      
  end
end
