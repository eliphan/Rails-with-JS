class AdminsController < ApplicationController
    layout 'admin'
    def home
        @user = current_user
        if @user
            if @user.admin 
                render :home 
            else
                flash[:alert] = "You're not authorized as an admin"
                redirect_to root_path
            end
        else
            flash[:alert] = "Please log in first"
            redirect_to new_user_session_path
        end
    end

    def index
        @users = User.all
        @books = Book.all
        @chapters = Chapter.all
    end
end
