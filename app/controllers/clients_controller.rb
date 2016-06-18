class ClientsController < ActionController::Base
  before_action :authenticate_collaborator!
  layout "admin"
  add_breadcrumb "Clientes", :clients_path
  before_action :set_client, only: [:destroy]
  before_action :set_client_and_person, only: [:show, :edit, :update]

  def index
    @clients = Client.all
  end

  def new
    add_breadcrumb "Nuevo Cliente"
    @person = Person.new
    @person.prepare_client
  end

  def edit
    add_breadcrumb "Editar Cliente"
    @person.prepare_client
  end

  def show
    add_breadcrumb "Mostrar Cliente"
  end

  def create
    @person = Person.new(client_person_params)
    if @person.save_client
      redirect_to clients_path, notice: 'Cliente creado con éxito.'
    else
      render :new
    end
  end

  def update
    @person.assign_attributes(client_person_params)
    if @person.save_client
      redirect_to clients_path, notice: 'Cliente actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    if @client.destroy
      redirect_to clients_path, notice: 'Cliente eliminado exitosamente.'
    end
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end

    def set_client_and_person
      set_client
      @person = @client.person
    end

    def client_person_params
      params.require(:person).permit(:id, :first_name, :last_name, :dni, :phone, :mobile, :email, :address, :birthday, :gender, :civil_status, client_attributes: [:id, :type])
    end

end
