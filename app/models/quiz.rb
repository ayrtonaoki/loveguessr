class Quiz < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :guest, class_name: 'User', optional: true

  has_many :questions
end
