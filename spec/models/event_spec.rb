require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#name' do
    context 'nilの時' do
      let(:event) { Event.new(name: nil) }

      it 'validでないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end

    context '空白の時' do
      let(:event) { Event.new(name: '') }

      it 'validでないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
  end
end
