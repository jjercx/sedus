class AppointmentsController < ActionController::Base
  before_action :authenticate_collaborator!
  layout "admin"
  add_breadcrumb "Citas", :appointments_path
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
    add_breadcrumb "Mostrar Cita"
  end

  def new
    add_breadcrumb "Nueva Cita"
    @appointment = Appointment.new
  end

  def edit
   add_breadcrumb "Editar Cita"
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: 'Cita creada con éxito.'
    else
      render :new
    end
  end

  def update
    @appointment.assign_attributes(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: 'Cita actualizada con éxito.'
    else
      render :edit
    end
  end

  def destroy
    if @appointment.destroy
      redirect_to appointments_path, notice: "Cita eliminada con éxito."
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:id, :status, :type, :cost, :client_id, :collaborator_id)
  end

end