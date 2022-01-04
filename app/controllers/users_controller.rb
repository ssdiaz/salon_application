class UsersController < ApplicationController
    
    def new
    end
    
    def create
        # User.create(user_params)
        # @user = User.create(user_params)
        # return redirect_to controller: 'users', action: 'new' unless @user.save
        # session[:user_id] = @user.id
        # redirect_to controller: 'static', action: 'home'
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @user
          else
            render 'new'
          end

    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
