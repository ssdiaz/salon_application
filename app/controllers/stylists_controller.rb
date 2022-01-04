class StylistsController < UsersController

    def index
        @stylists = User.where(client: false)
        @users = User.all
    end
end