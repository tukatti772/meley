class User < ActiveRecord::Base 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :dairyanswers
  has_many :dairies
  has_many :dairies, through: :bookmarks
  has_many :bookmarks, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  #:sourceパラメーターを使用し、「following配列の元はfollowed idの集合である」ということを明示的にRailsに伝えます。
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  validates :nickname, presence: true
  validates :comment, presence: true

#paperclip用の記述

has_attached_file :avatar, styles: { medium: "100x100#", thumb: "30x30#" },
:path => ":attachment/:id/:style.:extension"
  

validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]


  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end



end
