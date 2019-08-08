class UsersController < ApplicationController

    def show 
        @users = User.all
        @index = params[:id]
        @city = City.find(User.find(params[:id]).city_id)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Création réussie"
            redirect_to '/'

        else
            render new_user_path  
        end 
    end

    private
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
