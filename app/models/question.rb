class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers

  validates :text, presence: true
  validates :question_type, presence: true

  enum question_type: {
    multiple_choice: 0,
    written_response: 1
  }
end
