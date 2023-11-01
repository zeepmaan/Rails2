class ReservationsController < ApplicationController
  def index
    @current_user = current_user
    @reservations = User.joins(reservations: :room).select('users.*,reservations.*,rooms.*').where(id: @current_user.id)
  end

  def new
  end

  def confirm
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number_of_people, :user_id, :room_id))
    if @reservation.invalid?
       @room = Room.find_by(params[:reservation][:room_id])
       render "rooms/show"
    end
  end
  
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number_of_people, :user_id, :room_id))
    if @reservation.save
      flash[:notice] = "予約をしました"
      redirect_to :reservations
    else
      @room = Room.find_by(params[:reservation][:room_id])
      render "rooms/show"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
