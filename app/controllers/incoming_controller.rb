class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_or_create_by(email: params[:sender])  
    @topic = Topic.find_or_create_by(title: params[:subject])
    @bookmark = Bookmark.find_or_initialize_by(url: params["body-plain"], user: @user)
    @bookmark.save   
    head 200
  end

end
