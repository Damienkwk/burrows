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
    @flat.user = current_user
    if @flat.save!
      redirect_to flats_path
    else
      render :new, status: :unprocessable_entity
    end

    # respond_to do |format|
    #   if @flat.save
    #     format.html { redirect_to flats_path }
    #     format.json # Follow the classic Rails flow and look for a create.json view
    #   else
    #     format.html { render "flats/new", status: :unprocessable_entity }
    #     format.json # Follow the classic Rails flow and look for a create.json view
    #   end
    # end

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
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name,
                                 :address,
                                 :description,
                                 :price_per_night,
                                 :number_of_guests)
  end
end
