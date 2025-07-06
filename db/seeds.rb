require 'faker'

puts "Cleaning up database..."
Faker::UniqueGenerator.clear

Answer.delete_all
Question.delete_all
Quiz.delete_all
User.delete_all

puts "Done!"

puts "\nSeeding database..."
users = 5.times.map do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password"
  )
end

20.times do
  owner = users.sample
  possible_guests = users.reject { |u| u == owner }
  guest = possible_guests.sample

  Quiz.transaction do
    quiz = Quiz.create!(
      title: Faker::Lorem.sentence(word_count: 10),
      description: Faker::Lorem.paragraph(sentence_count: 10),
      owner: owner,
      guest: guest
    )

    rand(3..5).times do
      question_type = [:multiple_choice, :written_response].sample

      question = quiz.questions.create!(
        text: Faker::Lorem.question,
        question_type: Question.question_types[question_type]
      )

      if question.multiple_choice?
        answer_count = rand(3..5)
        correct_answer_index = rand(0...answer_count)

        answer_count.times do |index|
          question.answers.create!(
            text: Faker::Lorem.word.capitalize,
            correct_answer: index == correct_answer_index
          )
        end
      elsif question.written_response?
        question.answers.create!(
          text: Faker::Lorem.sentence(word_count: 4),
          correct_answer: true
        )
      end
    end
  end
end

puts "Done!"
