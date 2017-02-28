class ArticlesController < ApplicationController
    def new 
        @article = Article.new
    end 
    
    def index 
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end 
    
    def edit
        @article = Article.find(params[:id])
    end 
    
    def create 
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            flash[:success] = "Article was created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end 
    
    def show
        @article = Article.find(params[:id])
    end 
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:danger] = " Article was destroyed"
        redirect_to articles_path
    end 
    
        
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:success] = "Article was Updated"
            redirect_to article_path(@article) #This is the show action path and it takes in a article 
        else 
            render "edit"
        end 
    end
    
    
    
    
    
    
    private 
    def article_params
        params.require(:article).permit(:title, :description)
    end

end 