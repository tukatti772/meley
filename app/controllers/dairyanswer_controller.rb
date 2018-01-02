class DairyanswerController < ApplicationController

before_action :move_to_QAs

def index
end

def create
  @dairyload = Dairy.find(params[:dairy_id])
  @dairyanswer = Dairyanswer.create(user_id: current_user.id, user_nickname: current_user.nickname,
    dairy_id: dairyanswer_params[:dairy_id], text: dairyanswer_params[:text], dairy_title: @dairyload.title, label: "D")  #ここの引数はbusianswer_paramsで良い気がするが
  redirect_to "/dairy/#{@dairyanswer.dairy.id}"
end

#以下いいね！機能に関するコード

def like
  Like.create(user_id: current_user.id, dairyanswer_id: params[:id])
  @data = Dairyanswer.find(params[:id])
  @id = params[:id]
end

def like_delete
  Like.find_by(user_id: current_user.id, dairyanswer_id: params[:id]).destroy
  @data = Dairyanswer.find(params[:id])
  @id = params[:id]
end


private
def dairyanswer_params
  params.permit(:text, :dairy_id)
end

def move_to_QAs
  redirect_to "dairy/index" unless user_signed_in?
  #サインインしてない状態で投稿しようとした場合、indexに返す
end

end
