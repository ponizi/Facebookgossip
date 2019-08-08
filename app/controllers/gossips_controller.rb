class GossipsController < ApplicationController
    def new
        @gossip = Gossip.new
      end

      def create
        @gossip = Gossip.new(gossip_params)
        @gossip.user_id=rand(1..10)
        if @gossip.save
            flash[:notice] = "Gossip ajouté xoxo"
            redirect_to '/'
        else
            render new_gossip_path  
        end 
      end
    
    def show
        @gossips = Gossip.all
        @gossip = Gossip.find(params[:id])
        @city = City.find(User.find(Gossip.find(params[:id]).user_id).city_id)
        @index = params[:id]
    end
    
    def edit
        @gossip = Gossip.find(params[:id])
    end

    def update
        @gossips = Gossip.all
        @gossip = Gossip.find(params[:id])
        if @gossip.update(gossip_params)
          redirect_to @gossip
        else
          render :edit
        end
    end

    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
    end

    private 

    def gossip_params
        params.require(:gossip).permit(:title, :content)
    end 

end