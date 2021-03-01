class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログイン後にユーザー情報のページにリダイレクト
    else
      # エラーメッセージを返してnewをレンダリング
      flash.now[:danger] = "メールアドレスまたはパスワードが正しくありません"
      render 'new'
    end
  end

  def destroy

  end
end
