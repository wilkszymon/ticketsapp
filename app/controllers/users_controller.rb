class UsersController < ActionController::Base
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome #{@user.username}, you have successfully sign up"
            redirect_to root_path
        else
            render 'new'
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :password)
        end
end