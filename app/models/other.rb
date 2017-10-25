class Other < ActiveRecord::Base
  has_many :otheranswers
  belongs_to :user
end
