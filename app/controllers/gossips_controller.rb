class GossipsController < ApplicationController
    def new
        if current_user
        @gossip = Gossip.new
        else
        redirect_to new_session_path
        end
      end

      def create
        @gossip = Gossip.new(gossip_params)
        @gossip.user_id = current_user
        if @gossip.save
            flash[:notice] = "Gossip ajouté xoxo"
            redirect_to '/'
            
        else
            render new_gossip_path  
        end 
      end
    
    def show
        if current_user
        @gossip = Gossip.find(params[:id])
        @gossips = Gossip.all
        @gossip = Gossip.find(params[:id])
        @city = City.find(User.find(Gossip.find(params[:id]).user_id).city_id)
        @index = params[:id]
        else 
        redirect_to new_gossip_path
        @city = City.find(User.find(Gossip.find(params[:id]).user_id).city_id)
        end
    end
    
    def edit
        unless current_user = Gossip.find(params[:id]).user_id
        @gossip = Gossip.find(params[:id])
        end
        @gossip = Gossip.find(params[:id])
        flash[:notice] = "Impossible de modifier le potin d'un autre utilisateur"
        render :edit

    end

    def update
        unless current_user = Gossip.find(params[:id]).user_id
        @gossips = Gossip.all
        @gossip = Gossip.find(params[:id])
        @gossip.update(gossip_params).valid
            redirect_to @gossip
            render :edit
        end
        @gossip = Gossip.find(params[:id])
            flash[:notice] = "Impossible de modifier le potin d'un autre utilisateur"
            render :edit
    end

    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
    end

    private 

    def gossip_params
        params.require(:gossip).permit(:title, :content)
    end 

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end

end