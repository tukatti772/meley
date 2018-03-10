class BookmarkController < ApplicationController

  before_action :require_login


def create
  @bookmark = Bookmark.create(user_id: current_user.id, dairy_id: params[:id])
end

def destroy
  @breakbookmark = Bookmark.where(user_id: current_user.id, dairy_id: params[:id])
  @breakbookmark.destroy
end


private

def require_login
  unless user_signed_in?
  redirect_to controller: :dairy, action: :index
end


end