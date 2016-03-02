require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it {is_expected.to respond_to :create}
  end
end
