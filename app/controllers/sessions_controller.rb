class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.find_by(email: params[:email])
    puts user
    puts user.email
    puts user.first_name
    puts user.last_name
    puts params[:password]
    puts user.password_digest
    puts user.authenticate(params: [:password])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas
  
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render new_session_path
    end
  end

  def destroy
  end


end
