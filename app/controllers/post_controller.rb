class PostController < ApplicationController
  def index
    @posts = current_user.posts.all
  end
end
