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

  private

  def profil_params
    params.require(:user).permit(:user_name, :last_name, :first_name, :email, :password, :password_confirmation, :encrypted_password)
  end
end
