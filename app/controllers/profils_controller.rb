class ProfilsController < ApplicationController
  def show
    @profil = User.find(params[:id])
  end

  def edit
    @profil = current_user
  end

  def update
    @profil = current_user
    if @profil.update(profil_params)
      redirect_to profil_path(@profil)
    else
      redirect_to edit_profil_path(@profil)
      render :edit
    end
  end

  def bookings_received
    @profil = User.find(params[:id])
    @offers = @profil.offers.includes(:reservations)
    @bookings_received = Reservation.where(offer_id: @offers.pluck(:id)).where.not(user_id: @profil.id).where(status: "pending")
  end

  def bookings_received_accepted
    @profil = User.find(params[:id])
    @offers = @profil.offers.includes(:reservations)
    @bookings_received = Reservation.where(offer_id: @offers.pluck(:id)).where.not(user_id: @profil.id).where(status: "accepted")
  end

  def bookings_received_declined
    @profil = User.find(params[:id])
    @offers = @profil.offers.includes(:reservations)
    @bookings_received = Reservation.where(offer_id: @offers.pluck(:id)).where.not(user_id: @profil.id).where(status: "declined")
  end

  private

  def profil_params
    params.require(:user).permit(:user_name, :last_name, :first_name, :email, :password, :job, :rank, :password_confirmation, :encrypted_password, :photo )
  end
end
