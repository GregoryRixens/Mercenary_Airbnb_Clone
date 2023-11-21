class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :offers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, format: { with: Devise.email_regexp }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  validates :user_name, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :first_name, presence: true, length: { maximum: 255 }

  private

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
end
