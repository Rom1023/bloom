class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @comments = Comment.new
  end
end
