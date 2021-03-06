class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception, prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:raffle_id, :email, :password, :password_confirmation)}
  end
end
