class UsersController < ApplicationController


def show
  #質問一覧ページ用
  @questions1 = Business.where(user_id: params[:id])
  @questions2 = Dairy.where(user_id: params[:id])
  @questions3 = Other.where(user_id: params[:id])
  @allquestions = @questions1 + @questions2 + @questions3
  @allquestions2 = Kaminari.paginate_array(@allquestions).page(params[:question_page]).per(15)
  #kaminariで配列に対してページネーションする方法。便利なので覚えておこう。
  @showID = params[:id]
  @user = User.find(params[:id])
end


def questions
  #回答一覧ページ用
  @answers1 = Busianswer.where(user_id: params[:id])
  @answers2 = Dairyanswer.where(user_id: params[:id])
  @answers3 = Otheranswer.where(user_id: params[:id])
  @allanswers = @answers1 + @answers2 + @answers3
  @allanswers2 = Kaminari.paginate_array(@allanswers).page(params[:answer_page]).per(15)
  @user = User.find(params[:id])
  @questionsID = params[:id]
end


def counts
 @user = User.find(params[:id])
 @countsID = params[:id]
 #以下質問総数の計算
 @questionb = Business.where(user_id: params[:id]).count
 @questiond = Dairy.where(user_id: params[:id]).count
 @questiono = Other.where(user_id: params[:id]).count
 @sumquestion = @questionb + @questiond + @questiono
 #以下回答総数の計算
 @answerb = Busianswer.where(user_id: params[:id]).count
 @answerd = Dairyanswer.where(user_id: params[:id]).count
 @answero = Otheranswer.where(user_id: params[:id]).count
 @sumanswer = @answerb + @answerd + @answero
end


end