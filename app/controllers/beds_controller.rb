class BedsController < ApplicationController
  before_action :set_flat, :set_room, only: [:new, :create]

  def new
    @bed = Bed.new
    @beds = Bed.all
  end

  def create
    @beds = []
    @bed = Bed.new
    bed_params[:category].each do |cat|
      if cat.length > 0
        @bed = Bed.new(category: cat)
        @bed.room = @room
        @beds.push(@bed)
      end
    end
    if @beds.empty?
      render :new, status: :unprocessable_entity
    else
      @beds.each do |bed|
        bed.save
      end
      redirect_to @flat
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def bed_params
    params.require(:bed).permit(category: [])
  end

end
