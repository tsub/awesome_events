require 'rails_helper'

RSpec.describe "events/show", type: :view do
  context '@eventにイベント情報が格納されている時' do
    let(:event) { create(:event) }

    before do
      assign(:event, event)
      render
    end

    it 'イベント名が見出しとして表示されていること' do
      expect(rendered).to match /#{event.name}/
    end
  end
end
