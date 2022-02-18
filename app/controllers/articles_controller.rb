class ArticlesController < ApplicationController
  before_action :set_article, only:[:edit, :update, :destroy]
  
  def index
    @articles = Article.all.order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      flash[:error] = "Blank field"
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      flash[:error] = "Blank field"
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :author, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end