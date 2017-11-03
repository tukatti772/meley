class BusinessController < ApplicationController


def index
  @businesses = Business.all.order(created_at: :desc).page(params[:page]).per(15)
  @busikaitousu = Busianswer.group(:business_id).count
  @businesslink = "business"   #変数に文字列を入れるときはダブルクォート
  #ハッシュがどうなっているかは、binding.pryで確認すると非常に便利！
end

def create
  Business.create(name: current_user.nickname, text: business_params[:text], label: "B",
    user_id: current_user.id)
  redirect_to action: :index    #投稿後にQ&A一覧画面に戻る
end

def search   #Businessテーブル内容の検索。
  @busisearch = Business.where('text LIKE(?)', "%#{params[:keyword]}%").order(created_at: :desc)
  @busikaitousub = Busianswer.group(:business_id).count
  @busisearchlink = "business"
end

def posting
  redirect_to action: :index unless user_signed_in?
  #サインインしてない状態で投稿しようとした場合、indexに返す
end

def show
  @businessdata = Business.find(params[:id])
  @businessanswer = @businessdata.busianswers.order(created_at: :desc)
end

#以下いいね！機能に関するコード

def like
  Like.create(user_id: current_user.id, business_id: params[:id])
  @data = Business.find(params[:id])
end

def like_delete
  Like.find_by(user_id: current_user.id, business_id: params[:id]).destroy
  @data = Business.find(params[:id])
end

private
def business_params
  params.permit(:text)
end

end
