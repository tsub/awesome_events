require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#name' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
  end

  describe '#place' do
    it { should validate_presence_of(:place) }
    it { should validate_length_of(:place).is_at_most(100) }
  end

  describe '#content' do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_most(2000) }
  end

  describe '#start_time' do
    it { should validate_presence_of(:start_time) }

    context 'start_timeがend_timeより前の時間の時' do
      let(:event) { build(:event) }

      it 'validであること' do
        event.valid?
        expect(event.errors[:start_time]).to be_blank
      end
    end

    context 'start_timeがend_timeより後の時間の時' do
      let(:event) { build(:event, :has_invalid_end_time) }

      it 'validでないこと' do
        event.valid?
        expect(event.errors[:start_time]).to be_present
      end
    end
  end

  describe '#end_time' do
    it { should validate_presence_of(:end_time) }
  end
end
