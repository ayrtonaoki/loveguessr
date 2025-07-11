require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'Associations' do
    it { should belong_to(:quiz) }
    it { should have_many(:answers) }
  end

  describe 'Validations' do
    context 'when has valid attributes' do
      it { should validate_presence_of(:text) }
      it { should validate_presence_of(:question_type) }

      it 'creates a valid Question' do
        question = create(:question)

        expect(question).to be_valid
      end

      it 'is a valid Question when has the correct enum mappings for question_type' do
        expect(Question.question_types).to eq({
          'multiple_choice' => 0,
          'written_response' => 1
        })
      end
    end

    context 'when has invalid attributes' do
      it 'is invalid without a quizz' do
        question = build(:question, quiz: nil)

        expect(question).to be_invalid
        expect(question.errors[:quiz]).to include("must exist")
      end

      it 'is invalid without a text' do
        question = build(:question, text: nil)

        expect(question).to be_invalid
        expect(question.errors[:text]).to include("can't be blank")
      end

      it 'is invalid without a question_type' do
        question = build(:question, question_type: nil)

        expect(question).to be_invalid
        expect(question.errors[:question_type]).to include("can't be blank")
      end
    end
  end
end
