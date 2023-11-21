class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @offer = Offer.find(params[:reservation][:offer_id])
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

  private

  def reservation_params
    params.require(:reservation).permit(:description, :start_date, :end_date)
  end
end
