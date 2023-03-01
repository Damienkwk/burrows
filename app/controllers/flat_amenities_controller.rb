class FlatAmenitiesController < ApplicationController
  before_action :set_flat_amenity, only: %i[ destroy]

  def index
    @flat = Flat.find(params[:flat_id])
    @flat_amenities = FlatAmenity.where(flat_id: @flat)
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @flat_amenity = FlatAmenity.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @flat_amenity = FlatAmenity.new(flat_amenity_params)
    @flat_amenity.flat = @flat
    if @flat_amenity.save!
      redirect_to flat_flat_amenities_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_flat_amenity
    @flat_amenity = FlatAmenity.find(params[:id])
  end

  def flat_amenity_params
    params.require(:flat_amenity).permit(:amenity_id)
  end
end
