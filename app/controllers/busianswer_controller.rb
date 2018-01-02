class BusianswerController < ApplicationController

before_action :move_to_QAs

def index
end

def create
  @busiload = Business.find(params[:business_id])
  @busianswer = Busianswer.create(user_id: current_user.id, user_nickname: current_user.nickname,
    business_id: busianswer_params[:business_id], text: busianswer_params[:text], business_title: @busiload.title, label: "B")  #ここの引数はbusianswer_paramsで良い気がするが
  redirect_to "/business/#{@busianswer.business.id}"
end

#以下いいね！機能に関するコード

def like
  Like.create(user_id: current_user.id, busianswer_id: params[:id])
  @data = Busianswer.find(params[:id])
  @id = params[:id]
end

def like_delete
  Like.find_by(user_id: current_user.id, busianswer_id: params[:id]).destroy
  @data = Busianswer.find(params[:id])
  @id = params[:id]
end


private
def busianswer_params
  params.permit(:text, :business_id)
end

def move_to_QAs
  redirect_to "business/index" unless user_signed_in?
  #サインインしてない状態で投稿しようとした場合、indexに返す
end

end
