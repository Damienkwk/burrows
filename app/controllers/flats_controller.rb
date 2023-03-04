class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = policy_scope(Flat)
    @bookmark = Bookmark.new
  end

  def show
    @booking = Booking.new
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
end
