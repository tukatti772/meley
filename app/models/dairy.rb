class Dairy < ActiveRecord::Base
  has_many :dairyanswers
  has_many :likes
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

#データベースのtagカラムに配列を格納できるようにする
  serialize :tag

#投稿の検証
  validates :text, presence: true
  validates :title, presence: true, length: {mininum: 1, maximum: 100 }
  validate :tag_content?
   #ユーザーがいいね！しているかどうか確認するメソッド

  def like_user(user_id)
    #下記はbusinessモデルのインスタンスと関連付いているモデルの情報を取得する書き方なので覚えておく
    likes.find_by(user_id: user_id)
  end

  #ブックマークしてたらtrueを返す
   def bookmarkornot(user_id,dairy_id)
    bookmarks.exists?(user_id: user_id, dairy_id: dairy_id)
   end



private
#タグ配列の全て空でないか？の検証
  def tag_content?
    if tag[0]=="" && tag[1]=="" && tag[2]=="" && tag[3]=="" && tag[4]==""
      errors.add(:tag, "を最低1つ入力してください。")
    end
  end

end
