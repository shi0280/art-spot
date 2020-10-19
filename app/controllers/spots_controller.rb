class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @spots1 = Spot.find(1841,1851,1861,1871,1881,1891,1901)
    @spots2 = Spot.find(1911,1921,1931,1941,1951,1961,1971)
    @spots3 = Spot.find(1981,1991,2001,2011,2021,2031,2041,2051,2061)
    @spots4 = Spot.find(2071,2081,2091,2101,2111,2121,2131)
    @spots5 = Spot.find(2141,2151,2161,2171,2181,2191,2201,2211)
    @spots6 = Spot.find(2221,2231,2241,2251,2261,2271,2281,2291)
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
