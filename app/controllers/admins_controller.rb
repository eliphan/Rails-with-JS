class AdminsController < ApplicationController
    layout 'admin'
    def home
        @user = current_user
        if @user
            if @user.admin 
                render :home 
            else
                redirect_to 'static_pages/home'
            end
        else
            flash[:alert] = "Welcome Back"
            redirect_to new_user_session_path
        end
    end

    def index
        @users = User.all
        @books = Book.all
    end
end
