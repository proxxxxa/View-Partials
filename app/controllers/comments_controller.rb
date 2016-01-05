class CommentsController < ApplicationController
    before_filter :sadhappy, only: [:create]

    
  
  def create
    article = Article.find(params[:comment][:article_id])
    comment = article.comments.create(comment_params)

    flash[:notice] = "Your comment was added."
    redirect_to article_path(article)
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :author_name, :body)
  end

  private 
   def sadhappy
     article = Article.find(params[:comment][:article_id])
     comment = article.comments(comment_params[:body]).gsub("sad", "happy")
    end
end
