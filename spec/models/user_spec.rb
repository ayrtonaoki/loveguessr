require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:owned_quizzes) }
    it { should have_many(:guest_quizzes) }
  end

  describe 'Validations' do
    context 'when has valid attributes' do
      it { should validate_presence_of(:email) }
      it { should validate_uniqueness_of(:email).case_insensitive }

      it { should allow_value('user@example.com').for(:email) }
      it { should_not allow_value('userexample.com').for(:email) }

      it 'creates a valid User' do
        user = create(:user)

        expect(user).to be_valid
      end
    end

    context 'when has invalid attributes' do
      it 'is invalid without an email' do
        user = build(:user, email: nil)

        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("can't be blank")
      end

      it 'is invalid with a duplicated email (case insensitive)' do
        create(:user, email: 'test@example.com')
        user = build(:user, email: 'TEST@EXAMPLE.COM')

        expect(user).not_to be_valid
        expect(user.errors[:email]).to include('has already been taken')
      end

      it 'is invalid without a password' do
        user = build(:user, password: nil)

        expect(user).not_to be_valid
        expect(user.errors[:password]).to include("can't be blank")
      end

      it 'is invalid with a too short password' do
        user = build(:user, password: '12345', password_confirmation: '12345')

        expect(user).not_to be_valid
        expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'is invalid with a improperly formatted email' do
        user = build(:user, email: 'invalid_email')

        expect(user).not_to be_valid
        expect(user.errors[:email]).to include('is invalid')
      end
    end
  end
end
