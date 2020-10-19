class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @spots1 = Spot.find(1,11,21,3141,51,61)
    @spots2 = Spot.find(71,81,91,101,111,121,131)
    @spots3 = Spot.find(141,151,161,171,181,191,201,211,221)
    @spots4 = Spot.find(231,241,251,261,271,281,291)
    @spots5 = Spot.find(301,311,321,331,341,351,361,371)
    @spots6 = Spot.find(381,391,401,411,421,431,441,451)
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
