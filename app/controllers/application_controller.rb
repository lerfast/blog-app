class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_referer

  protected

  # Devise parameter sanitizer para cuando se registren o actualicen datos de usuarios
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo, :bio])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :photo, :bio])
  end

  private

  # Método para recordar la última página visitada
  def set_referer
    session[:return_to] = request.referer if request.url != request.referer
  end
end
