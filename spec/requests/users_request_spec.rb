require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET signup_path" do
    it "return success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end
  end

end
