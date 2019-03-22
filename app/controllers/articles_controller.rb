class ArticlesController < ApplicationController
    before_action :move_to_index, except: :index

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def show
    @articles = Article.find(params[:id])
  end

  def new
    @articles = Article.new
  end

  def create
    @articles = Article.create(blog_params)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id === current_user.id
  end

  def edit
    @articles = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(blog_params) if article.user_id == current_user.id
  end

  private
    def blog_params
      params.require(:article).permit(:title, :image, :content).merge(user_id: current_user.id,)
    end
    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
