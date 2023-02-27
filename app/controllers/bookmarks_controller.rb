class BookmarksController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks
  end


end
