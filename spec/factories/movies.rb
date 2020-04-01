FactoryBot.define do
  factory :movie do
    name { Faker::Name.name }
    description { Faker::Movie.quote }
    start_date { Date.today }
    end_date { Date.today + 1.month }

    factory :with_reservations do
      transient do
        reservations_count { 5 }
      end

      after(:create) do |movie, evaluator|
        create_list(:reservation, evaluator.reservations_count, movie: movie)
      end
    end
  end

  factory :invalid_movie, parent: :movie do
    name { nil }
    description { nil }
  end

  factory :movie_basic_data, parent: :movie do
    description { nil }
  end
end
