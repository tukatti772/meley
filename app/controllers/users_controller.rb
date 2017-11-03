class UsersController < ApplicationController


def show
  #質問一覧ページ用
  @questions1 = Business.where(user_id: params[:id])
  @questions2 = Dairy.where(user_id: params[:id])
  @questions3 = Other.where(user_id: params[:id])
  @allquestions = @questions1 + @questions2 + @questions3
  #下記のようにして作成日順に並び替える。sortはRubyのメソッド。aとbを逆にすると昇順になる
  @allquestions2  = @allquestions.sort{|a,b| b.created_at <=> a.created_at}
  @allquestions3 = Kaminari.paginate_array(@allquestions2).page(params[:question_page]).per(15)
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
  @allanswers2 = @allanswers.sort{|a,b| b.created_at <=> a.created_at}
  @allanswers3 = Kaminari.paginate_array(@allanswers2).page(params[:answer_page]).per(15)
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
 #以下いいね！数の計算
 @iine1 = Business.where(user_id: params[:id])
 sum1 = 0
 @iine1.each do |count1|
  sum1 = sum1 + count1.likes_count
 end
 @iine2 = Busianswer.where(user_id: params[:id])
 sum2 = 0
 @iine2.each do |count2|
  sum2 = sum2 + count2.likes_count
 end
 @iine3 = Dairy.where(user_id: params[:id])
 sum3 = 0
 @iine3.each do |count3|
  sum3 = sum3 + count3.likes_count
 end
 @iine4 = Dairyanswer.where(user_id: params[:id])
 sum4 = 0
 @iine4.each do |count4|
  sum4 = sum4 + count4.likes_count
 end
 @iine5 = Other.where(user_id: params[:id])
 sum5 = 0
 @iine5.each do |count5|
  sum5 = sum5 + count5.likes_count
 end
 @iine6 = Otheranswer.where(user_id: params[:id])
 sum6 = 0
 @iine6.each do |count6|
  sum6 = sum6 + count6.likes_count
 end
 @lastsum = sum1 + sum2 + sum3 + sum4 + sum5 + sum6
end

end