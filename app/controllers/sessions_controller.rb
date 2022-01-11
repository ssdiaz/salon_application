class SessionsController < ApplicationController

    def new
        @session = params[:session]
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user && user.authenticate(params[:session][:password])
            log_in(user)
            redirect_to user
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end

    def google
        @user = User.find_or_create_by(uid: auth['uid']) do |user| 
            user.name = auth['info']['name']
            user.email = auth['info']['email']
            user.password =  SecureRandom.hex(10)
        end 

        if @user && @user.id
            log_in(@user)
            redirect_to @user
        else 
            redirect_to "/login"
        end 
    end

    def destroy
        session.delete(:user_id)
        @current_user = nil #set the current user to nil, although this won’t matter because of an immediate redirect to the root URL. 
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end 
end
