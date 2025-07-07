class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validates :correct_answer, inclusion: [true, false]
end
