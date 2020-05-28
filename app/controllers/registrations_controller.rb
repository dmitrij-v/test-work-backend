class RegistrationsController < ::DeviseTokenAuth::RegistrationsController

  def render_create_success
    render json: UserSerializer.new(current_user)
  end
end