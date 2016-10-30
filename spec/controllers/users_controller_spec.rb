require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #admirer" do
    it "returns http success" do
      get :admirer
      expect(response).to have_http_status(:success)
    end
  end

end
