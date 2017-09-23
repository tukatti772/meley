class DairyanswerController < ApplicationController

before_action :move_to_QAs

def index
end

def create
  @dairyanswer = Dairyanswer.create(user_id: current_user.id, user_nickname: current_user.nickname,
    dairy_id: dairyanswer_params[:dairy_id], text: dairyanswer_params[:text])  #ここの引数はbusianswer_paramsで良い気がするが
  redirect_to "/dairy/#{@dairyanswer.dairy.id}"
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
