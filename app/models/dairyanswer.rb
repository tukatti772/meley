class Dairyanswer < ActiveRecord::Base
  belongs_to :dairy
  has_many :likes
  belongs_to :user

  #投稿の検証
  validates :text, presence: true

   #ユーザーがいいね！しているかどうか確認するメソッド

  def like_user(user_id)
    #下記はbusinessモデルのインスタンスと関連付いているモデルの情報を取得する書き方なので覚えておく
    likes.find_by(user_id: user_id)
  end
  
end
