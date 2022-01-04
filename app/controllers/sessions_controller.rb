class SessionsController < ApplicationController

    def new
    end

    def create
        puts params
        puts " - - - - - - -- - - - - - - - "

        user = User.find_by(email: params[:session][:email].downcase)
                        # return head(:forbidden) unless @user.authenticate(params[:password])
        # user = user.try(:authenticate, params[:session][:password])
        # return redirect_to(controller: 'sessions', action: 'new') unless user
        # session[:user_id] = user.id
        # @user = user
        # redirect_to controller: 'static', action: 'about' #appointments -- need to change this

        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id #log_in user -- if you use the method in application_controller
            redirect_to user #user_url(user)
        else
        # Create an error message.
            flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
            render 'new'
        end


        # Parameters: {"authenticity_token"=>"[FILTERED]", "session"=>{"email"=>"sam@email.com", "password"=>"[FILTERED]"}, "commit"=>"Login"}
        # {"authenticity_token"=>"YQNvTJ...2URQ", "session"=>{"email"=>"sam@email.com", "password"=>"123"}, "commit"=>"Login", "controller"=>"sessions", "action"=>"create"}
    end

    def destroy
        session.delete(:user_id)
        @current_user = nil #set the current user to nil, although this won’t matter because of an immediate redirect to the root URL. 
        redirect_to '/'
    end

end
