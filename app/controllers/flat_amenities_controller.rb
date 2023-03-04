class FlatAmenitiesController < ApplicationController
  before_action :set_flat_amenity, only: %i[destroy]

  def index
    @flat = Flat.find(params[:flat_id])
    @flat_amenities = policy_scope(FlatAmenity)
    @flat_amenities = @flat.flat_amenities.joins(:amenity).order(:category)
    # @flat_amenities = FlatAmenity.joins(:amenity).where(flat_id: @flat).order(:category)
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @flat_amenity = FlatAmenity.new
    authorize @flat_amenity
  end

  def create
    @flat = Flat.find(params[:flat_id])
    selected_amenities = flat_amenity_params
    selected_amenities[:amenity_id].each do |amenity|
      @flat_amenity = FlatAmenity.new({amenity_id: amenity})
      @flat_amenity.flat = @flat
      authorize @flat_amenity
      @flat_amenity.save
    end
    redirect_to flat_flat_amenities_path(@flat.id)
  end

  def destroy
    @flat_amenity.destroy
    redirect_to flat_flat_amenities_path(@flat_amenity.flat_id), status: :see_other
  end

  private

  def set_flat_amenity
    @flat_amenity = FlatAmenity.find(params[:id])
    authorize @flat_amenity
  end

  def flat_amenity_params
    params.require(:flat_amenity).permit(amenity_id:[])
  end
end
