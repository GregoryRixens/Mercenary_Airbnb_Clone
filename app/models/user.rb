class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, format: { with: Devise.email_regexp }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  private

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
end
