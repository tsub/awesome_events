require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#name' do
    context '空白の時' do
      it 'validでないこと' do
        event = Event.new(name: '')
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
  end
end
