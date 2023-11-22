class ProfilsController < ApplicationController
  def show
    @profil = User.find(params[:id])
  end

  def edit
    @profil = current_user
  end

  def update
    @profil = current_user
    @profil.update(profil_params)
    redirect_to profil_path(@profil)
  end

  private

  def profil_params
    params.require(:user).permit(:user_name, :last_name, :first_name, :email, :password, :password_confirmation, :encrypted_password, :photo)
  end
end
