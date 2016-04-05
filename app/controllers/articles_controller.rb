class ArticlesController < ApplicationController
	before_action :find_article, only: [:edit, :update, :destroy, :show]
	
	def index
		@articles = Article.paginate(page: params[:page], per_page: 3)
	end
	
	def new
		@article= Article.new
	end
	
	def edit 

	end
	
	def show

	end
	
	def create
		debugger
		# render plain: params[:article].inspect
		@article = Article.new(article_params)
		@article.user = User.first
		
		if	(@article.save)
			flash[:success] = "Article was successfully created."
			redirect_to article_path(@article)
		else
			# flash[:notice] = "Could not create article."
			render :new
		end
	end
	
	def update
		# render plain: params[:article].inspect
		
		if	(@article.update(article_params))
			flash[:success] = "Article was successfully updated."
			redirect_to article_path(@article)
		else
			# flash[:notice] = "Could not create article."
			render :edit
		end
	end
	
	def destroy
			@article.destroy
			flash[:danger] = "Article was successfully removed."
			redirect_to articles_path
	end
	
	private
		def find_article
				@article = Article.find(params[:id])
		end
	
		def article_params # whitelist the parameters
			params.require(:article).permit(:title, :description)
		end
end
