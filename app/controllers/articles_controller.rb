class ArticlesController < ApplicationController
  def index
    if user_signed_in?
      @articles = Article.where(publish: true)
    else
      @articles = Article.where(access: 1, publish: true)
    end
  end

  def show
    @article = Article.find_by_hashed_id(params[:id])
    if @article.access == 1
       @access = 'private'
     else
      @access = 'public'
    end
  end

  def edit
    @article = Article.find_by_hashed_id(params[:id])
  end

  private


  def article_params
    params.require(:article).permit(:title, :body, :publish, :access, :link, :video, images: [])
  end
end
