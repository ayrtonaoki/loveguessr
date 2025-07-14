class Users::SessionsController < Devise::SessionsController
  respond_to :json

  # Disable flash messages in API mode
  def set_flash_message!(key, _opts = {})
    # no-op
  end

  # Custom JSON response on login
  def respond_with(resource, _opts = {})
    token = request.env['warden-jwt_auth.token'] # Get token from warden
    render json: {
      message: 'Signed in successfully.',
      user: resource,
      token: token
    }, status: :ok
  end

  # Custom response on logout
  def respond_to_on_destroy
    head :no_content
  end
end
