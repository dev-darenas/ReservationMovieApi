FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    identification { Faker::IDNumber.valid }
  end
end
