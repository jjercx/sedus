class AppointmentsController < ActionController::Base
  before_action :authenticate_collaborator!
  layout "admin"
  add_breadcrumb "Appointments", :appointments_path

  def index
  end
end