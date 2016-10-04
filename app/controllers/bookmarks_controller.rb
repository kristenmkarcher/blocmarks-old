class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.all
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(params.require(:bookmark).permit(:url))

    if @bookmark.save
      flash[:notice] = "Bookmark was saved successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])

    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      redirect_to topics_path, notice: "Bookmark was updated successfully."
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end

end
