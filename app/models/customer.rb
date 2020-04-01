class Customer < ApplicationRecord
  validates_presence_of :email, :identification
  validates :identification, uniqueness: true

  has_many :reservations
end
