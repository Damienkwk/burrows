class BookmarksController < ApplicationController

  def index
    # @bookmarks = current_user.bookmarks
    @bookmarks = policy_scope(Bookmark)
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark
    # check whether the bookmark exists; if so delete it
    unless @bookmark.save
      Bookmark.find_by(user: current_user, flat: @bookmark.flat).destroy
    end
    redirect_to root_path
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:flat_id)
  end

end
