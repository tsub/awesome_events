require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #new' do
    context 'ログインユーザーがアクセスした時' do
      before do
        user = create(:user)
        session[:user_id] = user.id

        get :new
      end

      it 'ステータスコードとして200が返ること' do
        expect(response).to have_http_status(200)
      end
    end

    context '未ログインユーザーがアクセスした時' do
      before do
        get :new
      end

      it 'トップページにリダイレクトさせること' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
