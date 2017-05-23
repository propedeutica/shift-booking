########################################################################
#  Class Application Controller
#
#  : Define parameters for Devise, protection in inherited controllers
########################################################################
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    return unless resource_name == :user
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name phone password])
  end

  def system_locked_in?
    return unless Myconfig.global_lock?
    flash[:alert] = t 'global_lock_error'
    redirect_to root_path
  end
end
