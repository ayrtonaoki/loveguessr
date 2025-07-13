class ApplicationController < ActionController::API
  before_action :authenticate_user!

  # Include this for CSRF protection adapted to API mode
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :null_session
end
