require 'rails_helper'

RSpec.describe "Gifts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/gifts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/gifts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/gifts/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/gifts/update"
      expect(response).to have_http_status(:success)
    end
  end

end
