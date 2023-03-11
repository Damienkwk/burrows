class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @flats = policy_scope(Flat)
    @bookmark = Bookmark.new
    if params[:query].present?
      results = Geocoder.search(params[:query]).first.coordinates
      @flats = Flat.near(results, 20)
    else
      @flats = Flat.all
    end
  end

  def show
    @booking = Booking.new
    @bookmark = Bookmark.new
    @marker = [{
      lat: @flat.latitude,
      lng: @flat.longitude
    }]
    @flat_amenities_preview = FlatAmenity.where(flat_id: @flat).first(5)
    flat_amenities
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat
    if @flat.save!
      redirect_to flats_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def flat_params
    params.require(:flat).permit(:name,
                                 :address,
                                 :description,
                                 :price_per_night,
                                 :number_of_guests,
                                 photos: [])
  end

  def flat_amenities
    set_flat
    @flat_amenities = policy_scope(FlatAmenity)
    @flat_amenities = FlatAmenity.where(flat_id: @flat)
    @categories = Amenity.distinct.pluck(:category)
    @categorised_flat_amenities = []
    @categories.each do |category|
      categorised_amenities = { category => [] }
      @flat_amenities.each do |flat_amenity|
        if Amenity.find(flat_amenity.amenity_id).category == category
          categorised_amenities[category].append(flat_amenity)
        end
      end
      @categorised_flat_amenities.append(categorised_amenities)
    end
  end
end
