class CollaboratorsController < ActionController::Base
  before_action :authenticate_collaborator!
  layout "admin"
  add_breadcrumb "Collaborators", :collaborators_path

  def index
    @collaborators = Collaborator.all
  end

  private

end
