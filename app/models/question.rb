class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers

  enum question_type: {
    multiple_choice: 0,
    written_response: 1
  }
end
