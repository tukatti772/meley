class DairyController < ApplicationController

def index
  @dairyposts = Dairy.all.page(params[:page]).per(15)
  @dairykaitousu = Dairyanswer.group(:dairy_id).count
  @dairylink = "dairy"
  #ハッシュがどうなっているかは、binding.pryで確認すると非常に便利！
end

def create
  Dairy.create(name: current_user.nickname, text: dairy_params[:text], label: "D",
    user_id: current_user.id)
  redirect_to action: :index    #投稿後にQ&A一覧画面に戻る
end

def search   #Dairyテーブル内容の検索。
  @dairysearch = Dairy.where('text LIKE(?)', "%#{params[:keyword]}%")
  @dairykaitousub = Dairyanswer.group(:dairy_id).count
  @dairysearchlink = "dairy"
end

def posting
    redirect_to action: :index unless user_signed_in?
  #サインインしてない状態で投稿しようとした場合、indexに返す
end

def show
  @dairydata = Dairy.find(params[:id])
  @dairyanswer = @dairydata.dairyanswers
end


private
def dairy_params
  params.permit(:text)
end



end
