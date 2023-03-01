class RoomsController < ApplicationController
  before_action :set_flat, only: [:new, :create]

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.flat = @flat
    if @room.save
      redirect_to flat_room_path(@flat, @room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end
end
