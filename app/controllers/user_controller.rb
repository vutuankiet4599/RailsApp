class UserController < ApplicationController
    before_action :check_login_user!
    def show
        @user = User.find(params[:id])
    end
end
