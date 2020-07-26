class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end
end
