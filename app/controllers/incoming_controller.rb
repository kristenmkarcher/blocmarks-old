class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!

  def create
    @user = User.find_by_email(email: params[:sender])  
    if user.nil?
      @user = User.create(email: params[:sender], password: "Welcome1", password_confirmation: "Welcome1")
    end
    @topic = Topic.find_or_create_by(title: params[:subject])
    @bookmark = Bookmark.find_or_initialize_by(url: params["body-plain"], user: @user)
    @bookmark.save   
    head 200
  end

end
