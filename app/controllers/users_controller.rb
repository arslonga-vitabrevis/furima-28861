class UsersController < ApplicationController
  def create
    @user = User.new(configure_permitted_parameters)
      if @user.save
        redirect_to root_path
      else
        render new_user_registration_path
      end
  end
end
