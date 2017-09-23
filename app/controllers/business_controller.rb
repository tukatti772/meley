class BusinessController < ApplicationController


def index
  @businesses = Business.all.page(params[:page]).per(15)
  @busikaitousu = Busianswer.group(:business_id).count
  @businesslink = "business"   #変数に文字列を入れるときはダブルクォート
  #ハッシュがどうなっているかは、binding.pryで確認すると非常に便利！
end

def create
  Business.create(name: current_user.nickname, text: business_params[:text])
  redirect_to action: :index    #投稿後にQ&A一覧画面に戻る
end

def search   #Businessテーブル内容の検索。
  @busisearch = Business.where('text LIKE(?)', "%#{params[:keyword]}%")
  @busikaitousub = Busianswer.group(:business_id).count
  @busisearchlink = "business"
end

def posting
  redirect_to action: :index unless user_signed_in?
  #サインインしてない状態で投稿しようとした場合、indexに返す
end

def show
  @businessdata = Business.find(params[:id])
  @businessanswer = @businessdata.busianswers
end

private
def business_params
  params.permit(:text)
end

end
