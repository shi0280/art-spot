class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @spots1 = Spot.find(1,2,3,4,5,6,7)
    @spots2 = Spot.find(8,9,10,11,12,13,14)
    @spots3 = Spot.find(15,16,17,18,19,20,21,22,23)
    @spots4 = Spot.find(24,25,26,27,28,29,30)
    @spots5 = Spot.find(31,32,33,34,35,36,37,38)
    @spots6 = Spot.find(39,40,41,42,43,44,45,46)
    @spots = Spot.all
    @spot = Spot.new
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


  def create
    Spot.create(spot_params)
  end
  
  private
  def spot_params
    params.require(:spot).permit(:name, :image)
  end

end
