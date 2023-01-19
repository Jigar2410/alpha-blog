class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :destroy, :edit, :update]
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end
    
    def edit
    end

    def show
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:success] = "Your Article is successfully created"
            redirect_to article_path(@article)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
         
        if @article.update(article_params)
            flash[:success] = "Your Article is successfully updated"
            redirect_to article_path(@article)
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @article.destroy
        flash[:danger] = "Your Article is successfully deleted"
        redirect_to articles_path, status: :see_other
    end
    private
        def set_article
            @article = Article.find(params[:id])
        end
        def article_params
            params.require(:article).permit(:title, :description)
        end
end