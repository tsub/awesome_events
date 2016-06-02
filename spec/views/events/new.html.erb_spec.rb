require 'rails_helper'

RSpec.describe "events/new", type: :view do
  context 'ログインユーザーがアクセスした時' do
    before do
      assign(:event, create(:event))
      render
    end

    it '「イベント作成」という見出しが含まれたトップページが表示されること' do
      expect(rendered).to match /イベント作成/
    end

    context 'かつ入力した内容にエラーがあった時' do
      let(:event) { build(:event, :has_invalid_end_time) }

      before do
        event.valid?
        assign(:event, event)
        render
      end

      it 'エラーメッセージが表示されていること' do
        expect(rendered).to match /#{event.errors.full_messages.first}/
      end
    end
  end
end
