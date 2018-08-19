class AppointmentsController < ApplicationController
  # before_action :authenticate_user!
  before_action :validate_token, only: [:new]
  def index
    @appointments = Appointment.all
    respond_to do |format|
      format.html
      format.json {
        render json: formatted_appointments(@appointments)
      }
    end
  end

  def new
    @appointment = Appointment.new
    # if current_user.admin?
    # elsif current_user.customer? and current_user.token != params[:token]
    #   redirect_to '/appointments', flash: {error: 'Dont have permission'}
    # else
    #   # @appointment.email = current_user.email
    #   # @appointment.first_name = current_user.first_name
    #   # @appointment.last_name = current_user.last_name
    # end
  end

  def method_name
    
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = "Thanks"

      redirect_to '/appointments'
    else
      flash[:error] = ""
      render 'new' 
    end
  end

  def destroy
    appointment = Appointment.find params[:id]
    appointment.destroy
    redirect_to '/appointments'
  end

  def generate_token
    t =  Token.new
    t.generate_token
    t.save
    redirect_to root_path(token: t.token)

    # user = User.find_by(email: params[:email])
    # if user.present?
    #   user.token = SecureRandom.hex(10) 
    #   if user.save
    #     ApplicationMailer.send_token(user.email, user.token).deliver_now
    #     redirect_to '/', flash: {success: 'Mail successfully sent'}
    #   end
    # else
    #   redirect_to '/', flash: {error: 'Error'}
    # end
  end

  private
  def appointment_params 
    params.require(:appointment).permit(:title, :first_name, :last_name, :email, :title, :start_date, :end_date, :description)
  end

  def formatted_appointments(appointments)
    appointments.map do |appointment|
      {id: appointment.id, title: appointment.title, 
        start: appointment.start_date, end: appointment.end_date}
    end
  end

  def validate_token
    token = Token.find_by(token: params[:token])
    if params[:token].blank? or (params[:token].present? and token.blank?)
      render plain: "You dont have permission"
      return false
    end
  end
end