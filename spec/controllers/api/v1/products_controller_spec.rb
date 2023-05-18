require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  let(:admin) { create(:admin) }

  before do
    sign_in admin
  end

  describe 'GET #top_products' do
    it 'returns a success response' do
      get :top_products
      expect(response).to be_successful
    end
  end

  describe 'GET #top_revenue_products' do
    it 'returns a success response' do
      get :top_revenue_products
      expect(response).to be_successful
    end
  end
end
