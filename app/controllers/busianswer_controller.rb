class BusianswerController < ApplicationController

before_action :move_to_QAs

def index
end

def create
  @busianswer = Busianswer.create(user_id: current_user.id, user_nickname: current_user.nickname,
    business_id: busianswer_params[:business_id], text: busianswer_params[:text])  #ここの引数はbusianswer_paramsで良い気がするが
  redirect_to "/business/#{@busianswer.business.id}"
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
