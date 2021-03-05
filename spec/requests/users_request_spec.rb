require 'rails_helper'

RSpec.describe "UnitTest of users controller", type: :request do

  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:second_user)
  end

  describe "GET signup_path" do
    it "return success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "Index" do
    context "without login" do
      it "is redirected to login path" do
        get users_path
        expect(response).to redirect_to login_path  
      end
    end
  end

  describe "Edit" do
    context "without login" do
      it "is redirected" do
        get edit_user_path(@user)
        expect(flash).not_to be_empty
        expect(response).to redirect_to login_url
      end
    end

    context "by other user" do
      it "is redirected to root_url" do
        log_in_as(@other_user)
        get edit_user_path(@user)
        expect(flash).to be_empty
        expect(response).to redirect_to root_url
      end
    end
  end

  describe "Update" do
    context "without login" do
      it "is redirected" do
        patch user_path(@user), params: { user: { name: @user.name,
                                                  email: @user.email } }
        expect(flash).not_to be_empty
        expect(response).to redirect_to login_url
      end
    end

    context "by other user" do
      it "is redirected to root_url" do
        log_in_as(@other_user)
        patch user_path(@user), params: { user: { name: @user.name,
                                                  email: @user.email } }
        expect(flash).to be_empty
        expect(response).to redirect_to root_url
      end
    end
  end



end
