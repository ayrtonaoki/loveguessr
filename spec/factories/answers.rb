FactoryBot.define do
  factory :answer do
    text { Faker::Lorem.sentence(word_count: 2) }
    correct_answer { [true, false].sample }
    association :question
  end
end
