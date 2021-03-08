class CommentsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @comment = Comment.new(comment_params)
    @comment.project = @project
    @comment.user = current_user
    if @comment.save
      # send comment to channel
      ProjectChannel.broadcast_to(
        @project,
        render_to_string(partial: "comment", locals: { comment: @comment })
      )
      redirect_to project_path(@project, anchor: "comment-#{@comment.id}")
    else
      render 'projects/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
