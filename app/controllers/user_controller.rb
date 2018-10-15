class UserController < ApplicationController
  def show
    @users = User.check_params(params)
  end
end
