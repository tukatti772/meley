class DairyanswerController < ApplicationController

before_action :move_to_QAs

def index
end

def create
  @dairydata = Dairy.find_by(id: params[:dairy_id])
  @dairyanswer = @dairydata.dairyanswers.order(created_at: :desc)
  @dairyanswerinstance = Dairyanswer.new(dairyanswer_params)

  if @dairyanswerinstance.save

  redirect_to "/dairy/#{@dairydata.id}"

  else

  #falseの場合、createアクションのインスタンス変数の情報を持ったまま、dairyコントローラーのshowアクションを描画する。
  render template: "dairy/show"

  end

end

#以下いいね！機能に関するコード

def like
  Like.create(user_id: current_user.id, dairyanswer_id: params[:dairyanswer_id])
  @data = Dairyanswer.find(params[:dairyanswer_id])
  @id = params[:dairyanswer_id]
end

def like_delete
  Like.find_by(user_id: current_user.id, dairyanswer_id: params[:dairyanswer_id]).destroy
  @data = Dairyanswer.find(params[:dairyanswer_id])
  @id = params[:dairyanswer_id]
end


private
def dairyanswer_params
   params.require(:dairyanswer).permit(:text).merge(dairy_id: params[:dairy_id], user_nickname: current_user.nickname, label: "D", user_id: current_user.id, dairy_title: @dairydata.title)
end

def move_to_QAs
  redirect_to "dairy/index" unless user_signed_in?
  #サインインしてない状態で投稿しようとした場合、indexに返す
end

end
