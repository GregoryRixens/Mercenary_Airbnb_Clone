class ProfilsController < ApplicationController
  helper_method :has_offer?
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
    @bookings_received = Reservation.where(offer_id: @offers.pluck(:id)).where.not(user_id: @profil.id)
  end

  def my_offers
    @profil = User.find(params[:id])
    @offers = @profil.offers
  end

  def my_bookings
    @profil = User.find(params[:id])
    @bookings = @profil.reservations
  end

  def has_offer?(job)
    current_user.offers.exists?(job: job)
  end

  private

  def profil_params
    params.require(:user).permit(:user_name, :last_name, :first_name, :email, :password, :job, :rank, :password_confirmation, :encrypted_password, :photo )
  end
end
