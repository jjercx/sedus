class ClientsController < ActionController::Base
  before_action :authenticate_collaborator!
  layout "admin"
  add_breadcrumb "Clients", :clients_path

  def index
  end
end