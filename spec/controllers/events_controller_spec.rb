require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #new' do
    context 'ログインユーザーがアクセスした時' do
      let(:user) { user = create(:user) }
      before do
        session[:user_id] = user.id

        get :new
      end

      it 'ステータスコードとして200が返ること' do
        expect(response).to have_http_status(200)
      end

      it '@eventにログインユーザーに紐付いた新規Eventオブジェクトが格納されていること' do
        expect(assigns(:event).owner).to be_a(user.class)
        expect(assigns(:event)).to be_a_new(Event)
      end

      it 'newテンプレートをrenderしていること' do
        expect(response).to render_template(:new)
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

  describe 'POST #create' do
    context 'ログインユーザーがアクセスした時' do
      let(:user) { create(:user) }
      let(:request_params) do
        {
          event: {
            name: 'event name',
            place: 'event place',
            content: 'event content',
            start_time: DateTime.new(2016, 1, 1, 0, 0, 0),
            end_time: DateTime.new(2016, 1, 2, 0, 0, 0)
          }
        }
      end

      before do
        session[:user_id] = user.id

        post :create, request_params
      end

      it '@eventにログインユーザーに紐付いたEventオブジェクトが格納されていること' do
        expect(assigns(:event).owner).to be_a(user.class)
      end

      it '@eventにリクエストパラメータとして送信した値が格納されていること' do
        expect(assigns(:event).name).to eq request_params[:event][:name]
        expect(assigns(:event).place).to eq request_params[:event][:place]
        expect(assigns(:event).content).to eq request_params[:event][:content]
        expect(assigns(:event).start_time).to eq request_params[:event][:start_time]
        expect(assigns(:event).end_time).to eq request_params[:event][:end_time]
      end

      it 'イベントを新規作成できていること' do
        expect(Event.last).to eq assigns(:event)
      end

      it '作成したイベントの詳細ページにリダイレクトされていること' do
        expect(response).to redirect_to(event_path(assigns(:event)))
      end
    end

    context '未ログインユーザーがアクセスした時' do
      before do
        post :create
      end

      it 'トップページにリダイレクトさせること' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
