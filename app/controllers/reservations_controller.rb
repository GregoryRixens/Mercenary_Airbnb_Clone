class ReservationsController < ApplicationController
  before_action :offer_id, only: [:new, :create]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.offer = @offer

    if @reservation.save
      puts "Redirecting to show page..."
      redirect_to reservation_path(@reservation), notice: 'Reservation was successfully created.'
    else
      puts "Rendering new template..."
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @offer = @reservation.offer
    @reservation.destroy

    if request.referer == offer_url(@offer)
      redirect_to offers_path
    else
      redirect_to request.referer
    end
  end

  def accepted_bookings
    @reservation = Reservation.find(params[:id])
    @reservation.status = "accepted"
    @reservation.save
    redirect_to request.referer
  end

  def declined_bookings
    @reservation = Reservation.find(params[:id])
    @reservation.status = "declined"
    @reservation.save
    redirect_to request.referer
  end

  private

  def offer_id
    @offer = Offer.find(params[:offer_id])
  end

  def reservation_params
    params.require(:reservation).permit(:description, :start_date, :end_date)
  end
end
