class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    @basic_user = Rails.application.credentials.basic_auth[:basic_auth_user]
    @basic_password = Rails.application.credentials.basic_auth[:basic_auth_password]

    authenticate_or_request_with_http_basic do |username, password|
      username == @basic_user && password == @basic_password
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname,
      :family_name,
      :first_name,
      :family_name_reading,
      :first_name_reading,
      :date_of_birth
    ])
  end
end