class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    @basic_user = Rails.application.credentials.basic_auth[:basic_auth_user]
    @basic_password = Rails.application.credentials.basic_auth[:basic_auth_password]

    authenticate_or_request_with_http_basic do |username, password|
      username == @basic_user && password == @basic_password
    end
  end
end
 