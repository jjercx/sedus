class CollaboratorsController < ActionController::Base
  before_action :authenticate_collaborator!
  layout "admin"
  add_breadcrumb "Colaboradores", :collaborators_path
  before_action :set_collaborator, only: [:destroy]
  before_action :set_collaborator_and_person, only: [:show, :edit, :update]

  def index
    @collaborators = Collaborator.all
  end

  def new
    add_breadcrumb "Nuevo Colaborador", :new_collaborator_path
    @person = Person.new
    @person.prepare_collaborator
  end

  def edit
    add_breadcrumb "Editar Colaborador", :edit_collaborator_path
    @person.prepare_collaborator
  end

  def show
    add_breadcrumb "Mostar Colaborador"
  end

  def create
    @person = Person.new(collaborator_person_params)
    if @person.save_collaborator
      redirect_to collaborators_path, notice: 'Colaborador creado con éxito.'
    else
      render :new
    end
  end

  def update
    @person.assign_attributes(collaborator_person_params)
    if @person.save_collaborator
      redirect_to collaborators_path, notice: 'Colaborador actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    if @collaborator.destroy
      redirect_to collaborators_path, notice: 'Colaborador eliminado exitosamente.'
    end
  end

  private

    def set_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    def set_collaborator_and_person
      set_collaborator
      @person = @collaborator.person
    end

    def collaborator_person_params
      params.require(:person).permit(:id, :first_name, :last_name, :dni, :phone, :mobile, :email, :address, :birthday, :gender, :civil_status, collaborator_attributes: [:id, :email, :role, :type, :status, :password, :salary])
    end

end
