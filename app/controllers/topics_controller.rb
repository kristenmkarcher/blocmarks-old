class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error saving the topic. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Topic was updated successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error saving the topic. Please try again."
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to topics_path
    else
      flash.now[:alert] = "There was an error deleting the topic."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
