class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :busianswers
  has_many :dairyanswers
  has_many :otheranswers
  has_many :businesses
  has_many :dairies
  has_many :others


#paperclip用の記述

has_attached_file :avatar, styles: { medium: "300x300#", thumb: "30x30#" },
:path => ":attachment/:id/:style.:extension"
  

validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]



end
