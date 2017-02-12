class ArticlesController < ApplicationController
    def new 
        @article = Article.new
    end 

    def create 
        @article = Article.new(article_params)
        @article.save
    end 
    def show
        @article = Article.find(params[:id])
    end 
    private 
    def article_params
        params.require(:article).permit(:title, :description)
    end

end 