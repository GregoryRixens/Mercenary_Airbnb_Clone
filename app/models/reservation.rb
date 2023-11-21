class Reservation < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  attr_accessor :selected_date
end
