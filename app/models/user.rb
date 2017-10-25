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
end
