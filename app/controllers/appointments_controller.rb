class AppointmentsController < ActionController::Base
  before_action :authenticate_collaborator!
  layout "admin"
  add_breadcrumb "Appointments", :clients_path

  def index
  end
end