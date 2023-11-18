require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(page).to have_current_path new_user_session_path
  end

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する
    user = FactoryBot.create(:user)
    # ログインする
    sign_in(user)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    user = FactoryBot.create(:user)
    user.password += "typo" # 誤ったpassword
    # ログインしようとする (correctはページ遷移判定を切り替える)
    sign_in(user, correct: false)
  end
end
