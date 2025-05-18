class User < ApplicationRecord
  # Validations
  validates :name, :date_of_birth, :email, :phone_number, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :email, uniqueness: true
  validates :address, presence: true
  has_many :posts

end

#Model names should match 
