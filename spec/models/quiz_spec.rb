require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'Associations' do
    it { should belong_to(:owner) }
    it { should belong_to(:guest) }
    it { should have_many(:questions) }
  end

  describe 'Validations' do
    context 'when has valid attributes' do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:description) }

      it 'creates a valid Quiz' do
        quiz = create(:quiz)

        expect(quiz).to be_valid
      end
    end

    context 'when has invalid attributes' do
      it 'is invalid without a title' do
        quiz = build(:quiz, title: nil)

        expect(quiz).to be_invalid
        expect(quiz.errors[:title]).to include("can't be blank")
      end

      it 'is invalid without a description' do
        quiz = build(:quiz, description: nil)

        expect(quiz).to be_invalid
        expect(quiz.errors[:description]).to include("can't be blank")
      end
    end
  end
end
