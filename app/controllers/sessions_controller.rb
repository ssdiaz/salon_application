class SessionsController < ApplicationController

    def new
    end

    def create
        # @user = User.find_by(id: params[:id])
        #  if @user && @user.password = params[:password]
        #     session[:]
        # end
        session[:email] = params[:email]
        
    end
    # Typically, your create method would look up a user in the database, 
    # verify their login credentials, and store the authenticated user’s id in the session 
    # – but we’re not doing that right now – our sessions controller is going to have to trust 
    # that you are who you say you are

    def destroy
        session.delete :username
    end

end
