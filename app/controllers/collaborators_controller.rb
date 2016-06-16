class CollaboratorsController < ActionController::Base
  before_action :authenticate_collaborator!

  def index
  end

end
