require 'rails_helper'

RSpec.describe "WishlistTypes", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/wishlist_types/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/wishlist_types/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/wishlist_types/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
