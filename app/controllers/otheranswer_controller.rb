class OtheranswerController < ApplicationController

before_action :move_to_QAs

def index
end

def create
  @otheranswer = Otheranswer.create(user_id: current_user.id, user_nickname: current_user.nickname,
    other_id: otheranswer_params[:other_id], text: otheranswer_params[:text])  #ここの引数はbusianswer_paramsで良い気がするが
  redirect_to "/others/#{@otheranswer.other.id}"
end


private
def otheranswer_params
  params.permit(:text, :other_id)
end

def move_to_QAs
  redirect_to "others/index" unless user_signed_in?
  #サインインしてない状態で投稿しようとした場合、indexに返す
end


end
