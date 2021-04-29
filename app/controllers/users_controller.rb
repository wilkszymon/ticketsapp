class UsersController < ApplicationController
  def new
    @user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Welcome #{@user.username}, you have successfully sign up"
        redirect_to tickets_path
    else
        render 'new'
    end
end

def show
    @user = User.find(params[:id])
    @tickets = @user.tickets
end

private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
