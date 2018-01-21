class TagsController < ApplicationController

def show
 @tagname = Tag.find(params[:id]).tag
 @posts = Tag.find(params[:id]).dairies.order(created_at: :desc).page(params[:page]).per(15)    #指定のタグが付いている投稿一覧を取得
 @dairykaitousu = Dairyanswer.group(:dairy_id).count
 @dairylink = "dairy"
end


end
