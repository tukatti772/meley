class Like < ActiveRecord::Base
  #counter_cacheで、親テーブルに紐づいている「いいね！」数を自動で取得する
  belongs_to :dairy, counter_cache: true
  belongs_to :dairyanswer, counter_cache: true
  belongs_to :user
end
