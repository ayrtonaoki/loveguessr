FactoryBot.define do
  factory :answer do
    association :question
    text { Faker::Lorem.sentence(word_count: 8) }
    correct_answer { false }
  end
end
