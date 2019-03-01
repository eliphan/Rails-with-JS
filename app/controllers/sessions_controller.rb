class SessionsController < ApplicationController

  def new
  end

  def create
    if auth
      @user = User.find_or_create_by(:uid => auth['uid']) do |user|
        user.name = auth['info']['name']
        end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.find_by(email: params[:user][:email])
      authenticated = @user.try(:authenticate, params[:user][:password])
      if @user && authenticated
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        binding.pry
        redirect_to 'new_user_session_path'
      end
    end
  end

  #   @user = User.find_or_create_by(:uid => auth['uid']) do |user|
  #     user.name = auth['info']['name']
  #   end
  #   session[:user_id] = @user.id
  # end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
