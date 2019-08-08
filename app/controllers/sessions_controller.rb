class SessionsController < ApplicationController
  def new
    @error = 0
  end
  
  def create
    email_attempt = params[:email]
    user = User.find_by(email: "#{email_attempt}")
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      name = User.find(session[:user_id]).first_name
      flash[:notice] = "Connexion réussie, Bienvenue #{name} !"
      redirect_to '/'
    else
      @error = 1
      render :new
    end    

  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end


end
