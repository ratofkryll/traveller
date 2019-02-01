class ApplicationController < ActionController::Base
  # layout 'application'

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  before_action :detect_cable_guy


  protected
  def detect_cable_guy
    if params[:cable_guy]
      request.variant = :cable
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :profile_pic])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :profile_pic])
  end
end
