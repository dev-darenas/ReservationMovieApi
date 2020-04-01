FactoryBot.define do
  factory :reservation do
    reservation_date { Date.today + 1.day }

    movie { create(:movie) }
    customer { create(:customer) }
  end

  factory :invalid_reservation, parent: :reservation do
    movie { create(:with_reservations, reservations_count: 10) }
  end
end
