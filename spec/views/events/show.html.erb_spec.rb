require 'rails_helper'

RSpec.describe "events/show", type: :view do
  context '指定したidのイベント情報が登録されていた時' do
    let(:user) { create(:user) }

    before do
      def view.current_user; end
      allow(view).to receive(:current_user).and_return(user)
    end

    context 'かつログインユーザーが作成したイベントである時' do
      let(:event) { create(:event, owner: user) }

      before do
        assign(:event, event)
        render
      end

      it 'イベント名が見出しとして表示されていること' do
        expect(rendered).to match /#{event.name}/
      end

      it '「イベントを編集する」というリンクが表示されていること' do
        expect(rendered).to have_link('イベントを編集する', edit_event_path(event))
      end
    end

    context 'かつログインユーザーが作成したイベントでない時' do
      let(:event) { build(:event) }

      before do
        assign(:event, event)
        render
      end

      it '「イベントを編集する」というリンクは表示されていないこと' do
        expect(rendered).not_to have_link('イベントを編集する')
      end
    end
  end
end
