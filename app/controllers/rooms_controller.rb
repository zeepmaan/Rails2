class RoomsController < ApplicationController
  def index
    @current_user = current_user
    @rooms = Room.all.where(create_id: @current_user.id)
  end

  def new
    @current_user = current_user
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_info, :room_price, :room_address, :create_id, images: []))
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to :rooms
    else
      @current_user = current_user
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @current_user = current_user
    @reservation = Reservation.new
  end
  
  def edit
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "部屋情報を削除しました"
    redirect_to :users
  end
end
