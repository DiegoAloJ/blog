class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
  	@articulos = Article.all
  end
  
  def show
  	
  end

  def new
  	@article = Article.new
  end
  
  def create
  	@article = Article.new(article_params)
  	respond_to do |format|
      if @article.save
        format.html {redirect_to @article, notice: "Artículo #{@article.title} creado exitosamente"}
        format.json {render :show, status: :created, location: @article}  		
    	else
    		format.html {redirect_to :new}
        format.json {render json: @article.errors, status: :unprocessable_entity}
    	end
    end
  end
  
  def edit

  end

  def update
    respond_to do |format|
    	if @article.update(article_params)
    		format.html {redirect_to @article, notice: "Artículo #{@article.title} modificado exitosamente"}
        format.json {render :show, status: :ok, location: @article}
    	else
    		format.html {render :edit}
        format.json {render json: @article.errors, status: :unprocessable_entity}
    	end
    end
  end
  def destroy 
    @article.destroy
    respond_to do |format|
      format.html {redirect_to articles_url, notice: "Artículo eliminado"}
      format.json {head :no_content}
    end
  end

  private
  def article_params
  	params.require(:article).permit(:title, :body)
  end
  def set_article
  	@article = Article.find(params[:id])
  end 
end