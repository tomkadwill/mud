class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :redirect_to_user

  private

  def redirect_to_user
    redirect_to 'http://www.google.com'
  end
end
