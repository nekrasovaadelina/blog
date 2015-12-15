class CommentsController < ApplicationController
  before_filter :authenticate_user!
  #expose_decorated(:article)
  #expose_decorated(:comment)
  #expose_decorated(:comments) {article.comments}
  expose(:article)
  expose(:comment)
  expose(:comments) {article.comments}

  def create
    comment = article.comments.create(comment_params)
    comment.user_id = current_user.id

    if comment.save
      redirect_to article_path(article), notice: 'Comment was successfully created.'
    else
      redirect_to article_path(article), notice: comment.errors.full_messages.join(", ")
    end
  end

  def destroy
    authorize comment, :own?
    comment.destroy
    redirect_to article_path(article), notice: 'Comment was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text, :user_id, :article_id)
    end
end
