class Users::SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_action :verify_authenticity_token

  # Disable flash messages in API mode
  def set_flash_message!(key, _opts = {})
    # no-op
  end

  # Custom JSON response on login
  def respond_with(resource, _opts = {})
    render json: { message: 'Signed in successfully.', user: resource }, status: :ok
  end

  # Custom response on logout
  def respond_to_on_destroy
    head :no_content
  end
end
