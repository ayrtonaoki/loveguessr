class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_quizzes, class_name: 'Quizz', foreign_key: 'owner_id'
  has_many :guest_quizzes, class_name: 'Quizz', foreign_key: 'guest_id'
end
