require 'rails_helper'

RSpec.describe Raffle, type: :model do
  context 'Validations' do
    context 'valid factories present' do
      it { expect(build(:raffle)).to be_valid }
    end

    context 'name' do
      context 'should be valid' do
        let(:valid) { build(:raffle, name: "Win a kid’s toy") }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:raffle, name: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end
  end

  context 'Associations' do
    it { should have_many(:users)}
  end
end
