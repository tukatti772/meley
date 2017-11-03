class OthersController < ApplicationController

def index
  @otherposts = Other.all.order(created_at: :desc).page(params[:page]).per(15)
  @otherkaitousu = Otheranswer.group(:other_id).count
  @otherlink = "others"
  #ハッシュがどうなっているかは、binding.pryで確認すると非常に便利！
end

def create
  Other.create(name: current_user.nickname, text: others_params[:text], label: "O",
    user_id: current_user.id)
  redirect_to action: :index    #投稿後にQ&A一覧画面に戻る
end

def search   #Otherテーブル内容の検索。
  @othersearch = Other.where('text LIKE(?)', "%#{params[:keyword]}%").order(created_at: :desc)
  @otherkaitousub = Otheranswer.group(:other_id).count
  @othersearchlink = "others"
end

def posting
    redirect_to action: :index unless user_signed_in?
  #サインインしてない状態で投稿しようとした場合、indexに返す
end

def show
  @otherdata = Other.find(params[:id])
  @otheranswer = @otherdata.otheranswers.order(created_at: :desc)
end

#以下いいね！機能に関するコード

def like
  Like.create(user_id: current_user.id, other_id: params[:id])
  @data = Other.find(params[:id])
end

def like_delete
  Like.find_by(user_id: current_user.id, other_id: params[:id]).destroy
  @data = Other.find(params[:id])
end


private
def others_params
  params.permit(:text)
end

end
