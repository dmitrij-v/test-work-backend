class SessionsController < ::DeviseTokenAuth::SessionsController

  def render_create_success
    render json: UserSerializer.new(current_user)
  end
end