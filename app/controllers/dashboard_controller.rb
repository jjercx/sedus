class DashboardController < ApplicationController
  before_action :authenticate_collaborator!
  layout "admin"

  def index
  end

end
