class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

def set_current_user
  @current_user = User.find_by(id: session[:user_id])
end

 protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:password,:password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :password, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password])
  end

Refile.secret_key = '85651bb2242c85514eddfbfe19c6eff88745f1624f1f4d18f1f8789f54514d8fc2bf30e9908c8c13de790ec11bdcf36b1dc9ff3e6d88d09bebc9ffa9b200b448'
end
