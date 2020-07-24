class ApplicationController < ActionController::Base
  #before_action :move_to_index, only: [:show, :edit]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  #def move_to_index
    #unless user_signed_in?
    # redirect_to action: :index
    #end
  #end

end
