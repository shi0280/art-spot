class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @spots1 = Spot.find(5,6,7,8,9,10)
    @spots2 = Spot.find(1,11,12,13,14,15,16)
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end 
# ikasakujyo
  # def create 
  #   Spot.create(spot_params)
  # end

  # private
  # def spot_params
  #   params.require(:spot).permit(:name, :image)
  # end

end
