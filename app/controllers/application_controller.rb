class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_collaborator!

  add_breadcrumb "Dashboard", :root_path

  def index
  end
end
