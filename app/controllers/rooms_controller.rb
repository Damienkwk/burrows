class RoomsController < ApplicationController
  before_action :set_flat, only: [:new, :create]

  def new
    @room = Room.new
    authorize @room
  end

  def create
    @room = Room.new(room_params)
    @room.flat = @flat
    authorize @room
    if @room.save
      redirect_to new_flat_room_bed_path(@flat, @room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    authorize @room
    @room.destroy
    redirect_to flat_path(@room.flat_id), status: :see_other
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end
end
