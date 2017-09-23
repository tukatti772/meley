class UsersController < ApplicationController

before_action :move_to_Top


def index
end

def show
  @answers = Busianswer.where(user_id: params[:id])
  @user = User.find(params[:id])
end

def move_to_Top
  redirect_to "toukou/index" unless user_signed_in?
  #サインインしてない状態で投稿しようとした場合、indexに返す
end


end
