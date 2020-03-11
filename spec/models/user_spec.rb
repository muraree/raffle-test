require 'rails_helper'

RSpec.describe User, type: :model do

  let(:raffle) { create(:raffle) }

  context 'Validations' do
    context 'valid factories present' do
      it { expect(build(:user, raffle_id: raffle.id)).to be_valid }
    end

    context 'email' do
      context 'should be valid' do
        let(:valid) { build(:user, raffle_id: raffle.id,email: "test@mail.com") }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:user, email: nil) }
        it { expect(invalid).not_to be_valid }
      end

      context 'should be invalid with uniqueness failure' do
        let(:invalid) { build(:user, email: "test@mail.com") }
        it { expect(invalid).not_to be_valid }
      end
    end

    context 'password' do
      context 'should be valid' do
        let(:valid) { build(:user, raffle_id: raffle.id, password: '123456') }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:user, raffle_id: raffle.id, password: nil) }
        it { expect(invalid).not_to be_valid }
      end

      context 'should be invalid with confirmation failure' do
        let(:invalid) { build(:user, raffle_id: raffle.id, password: '123456', password_confirmation: '12345') }
        it { expect(invalid).not_to be_valid }
      end
    end
  end

  context 'Associations' do
    it { should belong_to(:raffle) }
  end
end
