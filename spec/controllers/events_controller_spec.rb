require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #new' do
    before do
      get :new
    end

    it 'ステータスコードとして200が返ること' do
      expect(response).to have_http_status(200)
    end
  end
end
