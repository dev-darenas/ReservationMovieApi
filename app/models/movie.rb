class Movie < ApplicationRecord
  validates_presence_of :name, presence: true
  has_many :reservations
  before_save :default_values

  scope :by_date, -> (date= Date.today) {
    where("start_date <= '#{date}' AND end_date >= '#{date}' ")
  }

  def default_values
    self.start_date = start_date.presence || Date.today
    self.end_date   = end_date.presence || Date.today
  end
end
