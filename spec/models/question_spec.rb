require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'Association' do
    it { should belong_to(:quiz) }
    it { should have_many(:answers) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:question_type) }

    it 'defines the correct enum mappings for question_type' do
      expect(Question.question_types).to eq({
        'multiple_choice' => 0,
        'written_response' => 1
      })
    end

    context 'has valid results' do
      it 'when created with valid attributes' do
        question = create(:question)

        expect(question).to be_valid
      end
    end

    context 'has invalid results' do
      it 'when text is nil' do
        question = build(:question, text: nil)

        expect(question).to be_invalid
        expect(question.errors[:text]).to include("can't be blank")
      end

      it 'when question_type is nil' do
        question = build(:question, question_type: nil)

        expect(question).to be_invalid
        expect(question.errors[:question_type]).to include("can't be blank")
      end

      it 'is invalid without a question' do
        question = build(:question, quiz: nil)

        expect(question).to be_invalid
        expect(question.errors[:quiz]).to include("must exist")
      end
    end
  end
end
