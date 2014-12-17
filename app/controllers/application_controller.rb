class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    if session[:admin].present?
      true
    else
      redirect_to homes_path, notice: "You are not authorized to view this page!"
    end
  end
end
