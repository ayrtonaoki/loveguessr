require 'faker'

Quiz.delete_all
User.delete_all

users = []
5.times do
  users << User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password"
  )
end

20.times do |i|
  owner = users.sample
  possible_guests = users.reject { |u| u == owner }
  guest = [possible_guests.sample, nil].sample

  Quiz.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 10),
    owner: owner,
    guest: guest
  )
end

puts "Created #{users.count} users:"
users.each { |u| puts "#{u.id} - #{u.name} (#{u.email})" }

puts "\nCreated #{Quiz.count} quizzes:"
Quiz.all.each do |quiz|
  guest_name = quiz.guest ? quiz.guest.name : "No guest"
  puts "Quiz #{quiz.id}: #{quiz.title}, Owner: #{quiz.owner.name}, Guest: #{guest_name}"
end
