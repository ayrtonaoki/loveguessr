FactoryBot.define do
  factory :quiz do
    title { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph }
    association :owner, factory: :user
    association :guest, factory: :user
  end
end
