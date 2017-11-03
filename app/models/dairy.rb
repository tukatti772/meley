class Dairy < ActiveRecord::Base
  has_many :dairyanswers
  has_many :likes
  belongs_to :user

   #ユーザーがいいね！しているかどうか確認するメソッド

  def like_user(user_id)
    #下記はbusinessモデルのインスタンスと関連付いているモデルの情報を取得する書き方なので覚えておく
    likes.find_by(user_id: user_id)
  end

  
end
