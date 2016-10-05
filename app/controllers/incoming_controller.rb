class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    @user = User.find_by_email(params["sender"])
    @topic = Topic.find_by_title(params["subject"])

    if @user == nil
      @user = User.new(email: params["sender"])
      @user.save!
    end

    if @topic == nil
      @topic = Topic.new(title: params["subject"])
      @topic.save!
    end

    @bookmark == Bookmark.new(url: params["body-plain"], topic: @topic)
    @bookmark.save!

    head 200
  end
end
