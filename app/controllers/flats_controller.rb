class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
  end

  def edit
  end

  def update
    @flat.update(flat_params)
  end

  def destroy
    @flat.destroy
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def flat_params
    params.require(:flat).permit(:name,
                                 :address,
                                 :description,
                                 :price_per_night,
                                 :number_of_guests)
  end
end
