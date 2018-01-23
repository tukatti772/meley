class Dairy < ActiveRecord::Base
  has_many :dairyanswers
  has_many :likes
  belongs_to :user
  has_and_belongs_to_many :tags

#配列に対応させる
  serialize :tag

#投稿の検証
  validates :text, presence: true
  validates :title, presence: true, length: {mininum: 1, maximum: 100 }
  validate :tag_content?
  validate :tag_length?
   #ユーザーがいいね！しているかどうか確認するメソッド

  def like_user(user_id)
    #下記はbusinessモデルのインスタンスと関連付いているモデルの情報を取得する書き方なので覚えておく
    likes.find_by(user_id: user_id)
  end

#タグ配列のいずれかが20文字を超えていないか？の検証
private
  def tag_length?
    f=0
    while f <= 4 do
     if tag[f].length > 20          #命名規則のためか、ここでtagsとするとnilclassエラーになる
      errors.add(:tag, "タグ#{f+1}が20文字を超えています！")
     end
    f += 1
    end
  end

#タグ配列の全て空でないか？の検証
  def tag_content?
    if tag[0]=="" && tag[1]=="" && tag[2]=="" && tag[3]=="" && tag[4]==""
      errors.add(:tag, "タグを最低1つ入力してください！")
    end
  end

end
