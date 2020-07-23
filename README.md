# README
# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|image|string|null: false|
|text|text|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :users_spots
- has_many :spots,  through:  :users_spots
- has_many :tweets
- has_many :favorites

## spotsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false, unique: true|
### Association
- has_many :users_spots
- has_many :users,  through:  :users_spots
- has_many :tweets

## users_spotsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|spot_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :spot

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|spot_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :spot

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :tweet