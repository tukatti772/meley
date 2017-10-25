class Dairy < ActiveRecord::Base
  has_many :dairyanswers
  belongs_to :user
end
