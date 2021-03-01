require 'rails_helper'

RSpec.describe "IntegrationTest of user login", type: :request do
  describe "user login" do

    before do
      get login_path
    end

    context "invalid login" do
      it "displays flash message" do
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

    context "valid login" do
      
    end
    
  end
end
