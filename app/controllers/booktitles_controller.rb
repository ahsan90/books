class BooktitlesController < ApplicationController
  def index
    @booktitles = Booktitle.all
  end
end
