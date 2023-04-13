#frozen_string_literal: true

require 'rails_helper'

  describe 'トップ画面のテスト' do
    before do
      visit new_user_session_path
    end
    context '表示の確認' do
      it 'current_pathの確認' do
        expect(current_path).to eq('/users/sign_in')
      end
      it 'ヘッダーにリンクが存在するか' do
        expect(page).to have_link "", href: new_user_session_path
      end
    end
    context 'ログインの確認' do
      before do
        @user = FactoryBot.create(:user)
      end
      it "正常にsign_inできるか" do
        sign_in @user
      end
    end
    context 'top#' do
      it 'topに移動できる' do
        expect(current_path).to eq('users/mypage')
      end
      it 'トップ画面にh1タグでカレンダーの文字列が存在するか' do
        expect(page).to have_selector 'h2'
      end
    end
  end