# # frozen_string_literal: true

# require 'rails_helper'

#   describe 'トップ画面のテスト' do
#     before do
#       visit new_admin_session_path
#     end
#     context '表示の確認' do
#       it 'current_pathの確認' do
#         expect(current_path).to eq('/admin/sign_in')
#       end
#       it 'ヘッダーにリンクが存在するか' do
#         expect(page).to have_link "", href: new_user_session_path
#       end
#     end
#   end

#   describe 'adminのログイン遷移の確認' do
#     context 'adminのログインの確認' do
#       before do
#         @admin = FactoryBot.create(:admin)
#       end
#       it "正常にsign_inできるか" do
#         sign_in @admin
#       end
#     end
#     context 'top#' do
#       it 'topに移動できる' do
#         get admin_root_path
#         expect(response.status).to eq 200 #正常にレスポンスが返されHTTPステータス200が発生
#       end
#       it 'トップ画面にh1タグでカレンダーの文字列が存在するか' do
#         expect(page).to have_selector 'h1', with: 'カレンダー'
#       end
#     end
#   end