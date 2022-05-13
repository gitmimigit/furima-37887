require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET #index" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
