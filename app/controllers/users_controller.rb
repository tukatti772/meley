class UsersController < ApplicationController


def show
  #質問一覧ページ用
  @questions = Dairy.where(user_id: params[:id]).order(created_at: :desc).page(params[:page]).per(15)
  #@allquestions3 = Kaminari.paginate_array(@allquestions2).page(params[:question_page]).per(15)
  #kaminariで配列に対してページネーションする方法。便利なので覚えておこう。
  @showID = params[:id]
  @user = User.find(params[:id])
  #以下回答数表示用
  @count = Dairyanswer.group(:dairy_id).count
end


def questions
  #回答一覧ページ用
  @answers = Dairyanswer.where(user_id: params[:user_id]).order(created_at: :desc).page(params[:page]).per(15)
  @user = User.find(params[:user_id])
  @questionsID = params[:user_id]
end


def counts
 @user = User.find(params[:user_id])
 @countsID = params[:user_id]
 #以下質問総数の計算
 @questiond = Dairy.where(user_id: params[:user_id]).count
 #以下回答総数の計算
 @answerd = Dairyanswer.where(user_id: params[:user_id]).count
 #以下いいね！数の計算
 @iine3 = Dairy.where(user_id: params[:user_id])
 sum3 = 0
 @iine3.each do |count3|
  sum3 = sum3 + count3.likes_count
 end
 @iine4 = Dairyanswer.where(user_id: params[:user_id])
 sum4 = 0
 @iine4.each do |count4|
  sum4 = sum4 + count4.likes_count
 end
 @lastsum = sum3 + sum4 

 @follows = @user.following
 @followers = @user.followers
 @toeic = @user.toeic
 @toefl = @user.toefl
 @ielts = @user.ielts
 @eiken = @user.eiken

end


def follows
 @followsID = params[:user_id]
 @user = User.find(params[:user_id])
 @follows = @user.following
end

def followers
  @followersID = params[:user_id]
  @user = User.find(params[:user_id])
  @followers = @user.followers
end

def bookmarks
  @bookmarksID = params[:user_id]
  @user = User.find(params[:user_id])
  @bookmarklist = @user.dairies.order(created_at: :desc).page(params[:page]).per(15)
end


end