require 'rails_helper'

RSpec.describe "events/show", type: :view do
  context '指定したidのイベント情報が登録されていた時' do
    let(:event) { build(:event) }

    before do
      assign(:event, event)
      render
    end

    it 'イベント名が見出しとして表示されていること' do
      expect(rendered).to match /#{event.name}/
    end
  end
end
