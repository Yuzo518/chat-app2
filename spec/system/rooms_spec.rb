require 'rails_helper'

RSpec.describe "チャットルームの削除機能", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  it 'チャットルームを削除すると、関連するメッセージが全て削除されていること' do
    # サインインする
    sign_in(@room_user.user)
    # 作成されたチャットルームへ遷移する
    click_on(@room_user.room.name)
    # メッセージ情報を５つDBに追加する
    5.times do |num|
      text = Faker::Games::Pokemon.move
      fill_in 'message_content', with: text
      click_on("送信")
      #message = Message.create(content: Faker::Games::Pokemon.move, user_id: @room_user.user_id, room_id: @room_user.room_id )
    end
    # 「チャットを終了する」ボタンをクリックすることで、作成した５つのメッセージが削除されたことを確認する
    expect{
      click_on("チャットを終了する")
    }.to change { @room_user.room.messages.count }.by(-5)
    binding.pry
    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end
end
