class CitiesController < ApplicationController

    def show
        @cities = City.all
        @gossips = Gossip.all
        @index = params[:id]
        @users = User.all.find_by(city_id: @index)
      end

end
