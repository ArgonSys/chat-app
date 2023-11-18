require 'rails_helper'

RSpec.describe 'チャットルームの削除機能', type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  it 'チャットルームを削除すると、関連するメッセージがすべて削除されている' do
    # サインインする
    sign_in(@room_user.user)

    # 作成されたチャットルームへ遷移する
    click_on(@room_user.room.name)

    # メッセージ情報を5つDBに追加する
    num_messages = 5
    FactoryBot.create_list(:message, num_messages,
                            user_id: @room_user.user.id,
                            room_id: @room_user.room.id)

    # 「チャットを終了する」ボタンをクリックすることで、作成した5つのメッセージが削除されていることを確認する
    expect{
      click_on "チャットを終了する"
      sleep 1
    }.to change{ Message.count }.by(-num_messages)

    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end
end
