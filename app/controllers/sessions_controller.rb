class SessionsController < ApplicationController

    def new
    end

    def create
        puts params
        puts "HA HA HA HA HA HA"
        user = User.find_by(email: params[:email])
        # return head(:forbidden) unless @user.authenticate(params[:password])
        user = user.try(:authenticate, params[:password])
        return redirect_to(controller: 'sessions', action: 'new') unless user
        session[:user_id] = user.id
        @user = user
        redirect_to controller: 'static', action: 'about' #appointments -- need to change this


        # Parameters: {"authenticity_token"=>"[FILTERED]", "session"=>{"email"=>"sam@email.com", "password"=>"[FILTERED]"}, "commit"=>"Login"}
        # {"authenticity_token"=>"YQNvTJ...2URQ", "session"=>{"email"=>"sam@email.com", "password"=>"123"}, "commit"=>"Login", "controller"=>"sessions", "action"=>"create"}
    end

    def destroy
        if logged_in?
            session.delete :user_id
            redirect_to '/about'
        else
            redirect_to '/contact'
        end
    end

end
