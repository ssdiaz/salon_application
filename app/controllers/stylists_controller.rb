class StylistsController < UsersController

    def index
        @stylists = User.where(client: false)
        @users = User.all
    end


    # def new
    #     @user = User.new
    # end
    
    # def create

    #     @user = User.new(user_params)
    #     if @user.save
    #         log_in @user #session[:user_id] = user.id
    #         flash[:success] = "Welcome to the Salon App!"
    #         redirect_to @user #user_url(@user) or users#show -- profile page -- think I want this to be appointment in future
    #       else
    #         render 'new'
    #       end
    # end

    # def show
    #     @user = User.find(params[:id])
    # end

     private

    # def user_params
    #     params.require(:user).permit(:name, :email, :password, :password_confirmation, :client)
    # end

    # def create_stylist_obj
    #     @user = User.find(params[:id])
    #     if @user.client == false
    #         Stylist.new
    #     end
    # end

end
