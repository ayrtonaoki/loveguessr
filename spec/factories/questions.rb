FactoryBot.define do
  factory :question do
    text { Faker::Lorem.question }
    question_type { :multiple_choice }
    association :quiz
  end
end
