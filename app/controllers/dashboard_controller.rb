class DashboardController < ApplicationController
  before_action :authenticate_collaborator!
  layout "admin"
  add_breadcrumb "Dashboard", :root_path

  def index
  end

end
