require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'Association' do
    it { should belong_to(:owner) }
    it { should belong_to(:guest) }
    it { should have_many(:questions) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }

    context 'has valid results' do
      it 'when created with valid attributes' do
        quiz = create(:quiz)

        expect(quiz).to be_valid
      end
    end

    context 'has invalid results' do
      it 'when title is nil' do
        quiz = build(:quiz, title: nil)

        expect(quiz).to be_invalid
        expect(quiz.errors[:title]).to include("can't be blank")
      end

      it 'when description is nil' do
        quiz = build(:quiz, description: nil)

        expect(quiz).to be_invalid
        expect(quiz.errors[:description]).to include("can't be blank")
      end
    end
  end
end
