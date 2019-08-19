require 'rails_helper'

include Warden::Test::Helpers

describe 'タスク管理機能', type: :system, js: true do
  describe '一覧表示機能' do

    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:job, name: '最初のタスク', user: user_a)
    end


  
  end
end