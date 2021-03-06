class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
  end

 
  def new
    @article = Article.new
  end

 
  def edit
  end

  def create
    @article=Article.new(article_params)
    @article.user=current_user
    if @article.save
    flash[:success] = "Article was successfully created"
    redirect_to article_path(@article)
    else
    render 'new'
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_article
      @article = Article.find(params[:id])
    end

    def add_current_user
      unless user_signed_in?
        redirect_to user_session_path
        flash[:warning] = "please sign in"
      end
    end

    def article_params
      params.require(:article).permit(:title, :description, :username)
    end

end
