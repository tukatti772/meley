class DairyController < ApplicationController

def index
  @dairyposts = Dairy.all.order(created_at: :desc).page(params[:page]).per(15)
  @dairykaitousu = Dairyanswer.group(:dairy_id).count
  @dairylink = "dairy"
  #ハッシュがどうなっているかは、binding.pryで確認すると非常に便利！
end

def create
  Dairy.create(name: current_user.nickname, text: dairy_params[:text], label: "D",
    user_id: current_user.id, title: dairy_params[:title], tag: dairy_params[:field])
   redirect_to action: :index    #投稿後にQ&A一覧画面に戻る
end

def search   #Dairyテーブル内容の検索。
  @dairysearch = Dairy.where('title LIKE(?)', "%#{params[:keyword]}%").order(created_at: :desc)
  @dairykaitousub = Dairyanswer.group(:dairy_id).count
  @dairysearchlink = "dairy"
end

def posting
    redirect_to action: :index unless user_signed_in?
  #サインインしてない状態で投稿しようとした場合、indexに返す
end

def show
  @dairydata = Dairy.find(params[:id])
  @dairyanswer = @dairydata.dairyanswers.order(created_at: :desc)
end

#以下いいね！機能に関するコード

def like
  Like.create(user_id: current_user.id, dairy_id: params[:id])
  @data = Dairy.find(params[:id])
end

def like_delete
  Like.find_by(user_id: current_user.id, dairy_id: params[:id]).destroy
  @data = Dairy.find(params[:id])
end

private
def dairy_params
  params.permit(:text, :title, :field)
end



end
