class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:index, :show, :edit, :destroy] 


def new
    @user = User.new
end

def index
    @users = User.all
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
    @users = User.all
    @tickets = @user.tickets
end

def edit
end

def update
    if @user.update(user_params)
        flash[:notice] = "Update a user"
        redirect_to @user
    else
        render 'edit'
    end
end

def destroy
    @user.destroy
    redirect_to @user
end

private
    def user_params
        params.require(:user).permit(:username, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
