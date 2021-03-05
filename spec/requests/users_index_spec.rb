require 'rails_helper'

RSpec.describe "IntegrationTest of UsersIndex", type: :request do
  describe "User index" do
    before do
      @user = FactoryBot.create(:user)
      99.times do |n|
        name  = "test#{n+1}"
        email = "test#{n+1}@electronote.net"
        FactoryBot.create(:user, name: name, email: email)
      end
    end

    it "include pagination" do
      # ログイン
      # indexページにアクセス
      # 最初のページにユーザーがいることを確認
      # ページネーションのリンクがあることを確認
      log_in_as(@user)
      get users_path
      expect(response).to render_template 'users/index'
      expect(Capybara.string(response.body)).to be_has_css '.pagination'
      User.paginate(page: 1).each do |user|
      # expect(Capybara.string(response.body)).to be_has_css "a[href=#{user_path(user)}]", text: user.name
        expect(response.body).to include "<a href=\"#{user_path(user)}\">#{user.name}"
      end
    end
  end
end
