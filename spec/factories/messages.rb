FactoryBot.define do
  factory :message do
    content {Faker::Games::Pokemon.move}
    association :user
    association :room
  end
end