require 'rails_helper'

include Warden::Test::Helpers

describe 'タスク管理機能', type: :system, js: true do
  describe '一覧表示機能' do

    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:job, name: '最初のタスク', user: user_a)
    end

    
    before do
      visit login_path
      fill_in 'session_email', with: 'a@example.com'
      fill_in 'session_password', with: 'password'
      click_button 'ログイン'
    end

    it 'ユーザーAが作成したタスクが表示されている' do
      expect(page).to have_content '最初のタスク'
    end
  end
end