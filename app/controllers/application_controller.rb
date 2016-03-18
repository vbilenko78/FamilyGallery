class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_host_from_request

  private

  def set_host_from_request
    ActionMailer::Base.default_url_options = { host: request.host_with_port }
  end

  protected

  def configure_permitted_parameters
    # Only add some parameters
    devise_parameter_sanitizer.for(:accept_invitation).concat [:first_name, :last_name, :phone]
    # Override accepted parameters
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:first_name, :last_name, :phone, :password, :password_confirmation,
	       :invitation_token)
    end
  end
end
