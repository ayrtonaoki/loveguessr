require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'Associations' do
    it { should belong_to(:question) }
  end

  describe 'Validations' do
    context 'when has valid attributes' do
      it { should validate_presence_of(:text) }
      it { should allow_value(true, false).for(:correct_answer) }

      it 'creates a valid Answer' do
        answer = create(:answer)

        expect(answer).to be_valid
      end

      it 'creates a valid Answer when correct_answer is false by default' do
        answer = Answer.new(text: 'Sample answer', question: create(:question))

        expect(answer.correct_answer).to eq(false)
      end
    end

    context 'when has invalid attributes' do
      it 'is invalid without a question' do
        answer = build(:answer, question: nil)

        expect(answer).to be_invalid
        expect(answer.errors[:question]).to include("must exist")
      end

      it 'is invalid without a text' do
        answer = build(:answer, text: nil)

        expect(answer).to be_invalid
        expect(answer.errors[:text]).to include("can't be blank")
      end

      it 'is invalid when correct_answer is not true or false' do
        answer = build(:answer, correct_answer: nil)

        expect(answer).to be_invalid
        expect(answer.errors[:correct_answer]).to include("is not included in the list")
      end
    end
  end
end
