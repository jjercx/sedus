class CollaboratorsController < ActionController::Base
  before_action :authenticate_collaborator!
  layout "admin"
  add_breadcrumb "Collaborators", :root_path

  def index
  end

end
