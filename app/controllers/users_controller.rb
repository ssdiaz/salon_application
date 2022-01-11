class UsersController < ApplicationController
    before_action :require_logged_in, only: [:index, :show, :edit, :update, :destroy]

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            flash[:success] = "Welcome to the Salon App!"
            redirect_to @user
        else
            render 'new'
        end
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        check_if_profile_matches_current_user(@user)
    end

    def edit
        @user = User.find(params[:id])
        check_if_profile_matches_current_user(@user)
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.valid?
            flash[:success] = "User Profile Saved"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User Deleted"
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :uid) 
    end
end
