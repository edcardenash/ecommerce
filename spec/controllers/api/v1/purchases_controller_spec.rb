require 'rails_helper'

RSpec.describe Api::V1::PurchasesController, type: :controller do
  let(:admin) { create(:admin) }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #purchases_by_granularity' do
    it 'returns a success response' do
      get :purchases_by_granularity
      expect(response).to be_successful
    end
  end
end
