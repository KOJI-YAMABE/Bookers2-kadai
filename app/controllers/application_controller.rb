class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username, :email, :password, :password_confirmation ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :password, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password, :remember_me])
  end

end
