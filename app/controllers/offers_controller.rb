class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    @offers = Offer.all
    if params[:search].present? && params[:search][:search_query].present?
      @offers = Offer.search_by_title_and_description(params[:search][:search_query])
      if params[:search][:rank].present?
        @offers = search_by_rank(@offers, params)
      else
        return @offers
      end
    else
      @offers = Offer.all
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to offers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update

    if @offer.update(offer_params)
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offer.reservations.destroy_all
    @offer.destroy

    if request.referer == offer_url(@offer)
      redirect_to offers_path, notice: 'Offer was successfully destroyed.'
    else
      redirect_to request.referer, notice: 'Offer was successfully destroyed.'
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:title, :price, :description, :job, :rank, :address, :photo)
  end

  def search_by_rank(offers_temp, params)
    filtered_offer = offers_temp.select do |offer|
      offer if offer.rank == params[:search][:rank]
    end
    return filtered_offer
  end
end
