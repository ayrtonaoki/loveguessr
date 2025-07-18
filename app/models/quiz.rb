class Quiz < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :guest, class_name: 'User'

  has_many :questions

  validates :title, presence: true
  validates :description, presence: true
end
