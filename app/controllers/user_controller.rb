class UserController < ApplicationController
    before_action :check_login_user!
    def show
    end
end
