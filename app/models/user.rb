class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :owned_quizzes, class_name: 'Quiz', foreign_key: 'owner_id'
  has_many :guest_quizzes, class_name: 'Quiz', foreign_key: 'guest_id'
end
