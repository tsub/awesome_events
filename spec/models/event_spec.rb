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

    context '"Rails勉強会"の時' do
      let(:event) { Event.new(name: 'Rails勉強会') }

      it 'validであること' do
        event.valid?
        expect(event.errors[:name]).to be_blank
      end
    end

    context '50文字の時' do
      let(:event) { Event.new(name: 'a' * 50) }

      it 'validであること' do
        event.valid?
        expect(event.errors[:name]).to be_blank
      end
    end

    context '51文字の時' do
      let(:event) { Event.new(name: 'a' * 51) }

      it 'validでないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
  end
end
