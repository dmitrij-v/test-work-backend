class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: UserSerializer.new(current_user)
  end
end
