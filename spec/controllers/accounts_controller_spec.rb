require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe 'GET #index' do
    it {is_expected.to respond_to(:index)}
  end
end
