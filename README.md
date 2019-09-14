# Toggl

Ruby on Rails の練習として作りました。  
url : https://limitless-eyrie-57958.herokuapp.com/top    

## Useage

タスクの時間を測ってみんなでタスクを共有するアプリ  
![result](https://user-images.githubusercontent.com/45336815/64489098-128c1180-d28a-11e9-895e-c9689bc4e18a.gif)

## 主な機能

- 管理者権限機能  
  - 新規管理者登録機能    
  - ユーザー詳細表示機能　
  - ユーザー一覧表示機能  
  - ユーザーアカウント登録 ・ 削除機能  
  - ユーザーログイン機能  
  - 登録時メール配信機能  
- タスク機能  
  - 新規タスク登録機能  
  - タスク詳細表示機能  
  - タスク画像アップロード機能  
  - タスク削除 ・ 編集機能  
  - タスク一覧機能  
  - タスク検索機能
  - CSVインポート機能
  - CSVエクスポート機能
- 全タスク一覧  
  - 全タスク表示機能
- それぞれの画面のページネーション機能

## 使用技術
- 開発環境  
  - Docker for Mac  
- テスト  
  - Rspec  
- 本番環境  
  - Heroku(暫定、ECSに移行を検討中)  
- DB  
  - PostgreSQL    
- CI/CD  
  - CircleCI  
- フロント  
  - Materialize  
  - Slim  
- 画像  
  - Active-Storage  
- ページネーション機能  
  - kaminari  
- 検索  
  - ransack  
 
## 依存関係
- Rails: 6.0.0
- Ruby: 2.6.3
- Materialize 1.0.0
- Rspec 3.8
