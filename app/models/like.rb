class Like < ActiveRecord::Base
  #counter_cacheで、親テーブルに紐づいている「いいね！」数を自動で取得する
  belongs_to :business, counter_cache: true
  belongs_to :busianswer, counter_cache: true
  belongs_to :dairy, counter_cache: true
  belongs_to :dairyanswer, counter_cache: true
  belongs_to :other, counter_cache: true
  belongs_to :otheranswer, counter_cache: true
  belongs_to :user
end
