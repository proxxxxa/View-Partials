class CommentsController < ApplicationController
    before_filter :sadhappy, only: [:create]

    
  
  def create
    article = Article.find(params[:comment][:article_id])
    comment = article.comments.create(comment_params)

    if comment.save
      redirect_to article_path(article), notice: "Your comment was added!"
    else
      flash[:notice] = "Your comment failed."
      render :show
    end

  #  flash[:notice] = "Your comment was added."
  #  render action :show
  #  redirect_to article_path(article), notice: "Show"
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :author_name, :body)
  end

  private 
   def sadhappy
     article = Article.find(params[:comment][:article_id])
   #  comment = article.comments(comment_params[:body]).gsub("sad", "happy")
    end
end
