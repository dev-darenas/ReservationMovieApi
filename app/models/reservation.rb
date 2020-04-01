class Reservation < ApplicationRecord
  belongs_to :movie
  belongs_to :customer
  accepts_nested_attributes_for :customer

  validate :count_reservation, :valid_date_reservation

  scope :date, -> (date) {
    where(reservation_date: date)
  }

  scope :range_dates, -> (start_date= Date.today, end_date= Date.today) {
    where(reservation_date: (start_date...end_date))
  }

  delegate :name, :image_url, to: :movie, prefix: true
  delegate :email, :name, :identification, to: :customer, prefix: true

  def to_json
    {
      id: id,
      reservation_date: reservation_date,
      movie_name: movie_name,
      movie_image_url: movie_image_url,
      customer_email: customer_email,
      customer_name: customer_name,
      customer_identification: customer_identification,
    }
  end

  private

  def count_reservation
    if movie && movie.reservations.date(self.reservation_date).count >= 10
      errors.add(:number_reservations, "can't be greater than 10")
    end
  end

  def valid_date_reservation
    if movie.start_date > reservation_date || reservation_date > movie.end_date
      errors.add(:invalid_reservation_date, "is out of range")
    end
  end
end
