class UsersController < ApplicationController
  def home
  end

  def login
    if session[:user_id]
      redirect_to "/"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:info] = "Vous êtes maintenant déconnecté."
    redirect_to "/"
  end

  def check
    @current_user = User.where(email: params[:email], password: params[:password]).first
    if @current_user
      session[:user_id] = @current_user.id
      flash[:info] = "Bienvenue #{@current_user.first_name} !"
      redirect_to "/"
    else
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/sign_in"
    end
  end

  def signup
    if @current_user
      redirect_to "/"
    end
  end

  def create
    if params[:password] == params[:password_conf]
      User.create email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password]
      redirect_to "/users/sign_in"
    end
  end
end
