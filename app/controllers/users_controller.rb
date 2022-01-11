class UsersController < ApplicationController
    # Resource: https://3rd-edition.railstutorial.org/book/sign_up#cha-sign_up
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user #session[:user_id] = user.id
            flash[:success] = "Welcome to the Salon App!"
            redirect_to @user
        else
            render 'new'
        end
    end

    def index #DEF need to limit #delete????????????????????
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.valid?
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy #delete????????????????????
        User.find(params[:id]).destroy
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :uid) 
    end
end
