class UsersController < ApplicationController

    # after_validation_on_create :create_stylist_obj

    # Resource: https://3rd-edition.railstutorial.org/book/sign_up#cha-sign_up
    def new
        @user = User.new
    end
    
    def create
        # User.create(user_params)
        # @user = User.create(user_params)
        # return redirect_to controller: 'users', action: 'new' unless @user.save
        # session[:user_id] = @user.id
        # redirect_to controller: 'static', action: 'home'

        @user = User.new(user_params)
        if @user.save
            log_in @user #session[:user_id] = user.id
            flash[:success] = "Welcome to the Salon App!"
            redirect_to @user #user_url(@user) or users#show -- profile page -- think I want this to be appointment in future
          
            # @user = User.find(params[:id])
            if @user.client == false
                Stylist.create
            end
        
        
        else
            render 'new'
          end
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :client)
    end

    # def create_stylist_obj
    #     @user = User.find(params[:id])
    #     if @user.client == false
    #         Stylist.create
    #     end
    # end
end
