require 'rails_helper'

RSpec.describe "IntegrationTest of user login", type: :request do
  describe "user login" do

    before do
      @user = FactoryBot.create(:user)
      get login_path
    end

    context "invalid user" do
      it "fails in login and displays flash message" do
        post login_path, params: { session: { email:"", password:"" } }
        expect(response).to have_http_status(:success)

        # sessions/newがレンダリングされること
        expect(response).to render_template("sessions/new")

        # flashメッセージが表示されること
        expect(flash[:danger]).to be_truthy, "flash message is empty"

        # 別のページ(Topページなど)にいったん移動する
        get root_path

        # 移動先のページでフラッシュメッセージが表示されていないこと
        expect(flash[:danger]).to be_falsey, "flash message is not empty"
      end
    end

    context "valid user" do
      include UsersHelper
      it "succeeds in login" do
        post login_path, params: { session: { email: @user.email, password: @user.password } }
        expect(response).to redirect_to(@user)
        follow_redirect!
        expect(response).to render_template("users/show")
        assert_select "a[href=?]", login_path, count: 0
        assert_select "a[href=?]", logout_path
        assert_select "a[href=?]", user_path(@user)
      end
    end

    context "login with valid email/invalid password" do
      it "rails in login" do
        expect(response).to render_template("sessions/new")
        post login_path, params: { session: {email: @user.email, password: "invalid" } }
        expect(response).to render_template("sessions/new")
        expect(flash[:danger]).to be_truthy, "flash message is empty"
        get root_path
        expect(flash[:danger]).to be_falsey, "flash message is not empty"
      end
    end
    
  end
end
