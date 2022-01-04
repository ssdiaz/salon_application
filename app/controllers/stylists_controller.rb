class StylistsController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        raise params.inspect 
        
        @user = User.new(stylist_params.merge(client: false))

        if @user.save
            # @user.client = false
            # @user.save
            log_in @user #session[:user_id] = user.id
            flash[:success] = "Welcome to the Salon App!"
            puts params
            puts stylist_params
            redirect_to @user #user_url(@user) or users#show -- profile page -- think I want this to be appointment in future
          else
            render 'new'
          end
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def stylist_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, client: "false")#.with_defaults(client: false)
    end

end
