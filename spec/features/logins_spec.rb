require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  describe 'ユーザーがイベントの参加や登録を行うために、ログインをする' do
    context 'かつTwitterでのログインに成功した時' do
      before do
        visit root_path
        click_link 'Twitterでログイン'
      end

      it 'トップページに遷移していること' do
        expect(page.current_path).to eq root_path
      end
  end
end
