class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
    @offers = Offer.last(10)
  end

end
