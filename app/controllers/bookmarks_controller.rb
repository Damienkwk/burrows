class BookmarksController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    unless @bookmark.save
      Bookmark.find_by(user: current_user, flat: @bookmark.flat).destroy
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:flat_id)
  end

end
