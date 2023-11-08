class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_referer

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name photo bio])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name photo bio])
  end

  private

  def set_referer
    session[:return_to] = request.referer if request.url != request.referer
  end
end
