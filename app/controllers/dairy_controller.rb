class DairyController < ApplicationController

def index
  @dairyposts = Dairy.all.order(created_at: :desc).page(params[:page]).per(15)
  @dairykaitousu = Dairyanswer.group(:dairy_id).count
  @dairylink = "dairy"
  #ハッシュがどうなっているかは、binding.pryで確認すると非常に便利！
end

def create


  #create!メソッドは検証が通らなかった際にエラーを返す
  newdairy = Dairy.create!(dairy_params)

  #以下、投稿にタグを関連付けていく。入力フォームに空白があっても対応させている。
  tags = newdairy.tag

  f = 0
  while f <= 4 do
   if tags[f] != ""
    existTag = Tag.find_by(tag: tags[f])
     if existTag == nil
      tag = Tag.create!(tag: tags[f])
       newdairy.tags << tag  #newdairyに新規に作ったtag0を関連付け
     else 
       newdairy.tags << existTag  #newdairyに既存のタグを関連付け
     end
   end
  f += 1
  end

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

  @post = Dairy.new

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

#paramsで配列が送られてきたとき、カラム名:[]のようにすると、カラムに配列を格納できる
private
def dairy_params
  params.require(:dairy).permit(:text, :title, tag:[]).merge(name: current_user.nickname, label: "D", user_id: current_user.id)
end



end
