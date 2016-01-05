class ArticlesController < ApplicationController

  before_filter do
    @article = Article.find(params[:id]) if params[:id]
  end

  #   after_filter do
   #    @article.each do |art|
   #      art.title.upcase
  #     end
#     end

  #around_filter :wrap_actions

  #def  wrap_actions
  #begin

  def show
    
  end

  
  def index
   # @articles, @tag = Article.search_by_tag_name(params[:tag])
   @articles = Article.ordered_by(params[:title]).limit(5) #kako pozvati only methodu nakon sortiranja
   @article = Article.only(3)
   
   # @articles = Article.only(params[:only])
  end
  

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: params[:article][:title], body: params[:article][:body])
    if @article.save
      flash[:notice] = "Article was created."
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    
    if @article.update_attributes(article_params)
      flash[:notice] = "Article was updated."
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    redirect_to articles_path unless 1>1
    article = Article.find params[:id]
    article.destroy
    flash[:notice] = "#{article} was destroyed."
    redirect_to articles_path
  end


  
  private

  def article_params
    params.require(:article).permit(:title, :body, :author_id)
  end

  #rescue
  #flash[:notice] = "Apology."
  #redirect_to articles_path
  #end
#end
  
end
