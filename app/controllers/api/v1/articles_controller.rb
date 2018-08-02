module Api
	module V1
		class ArticlesController < ApplicationController
			
			def index
				@articles = Article.all
				render json: { status: 'SUCCESS', message: 'Loaded Articles', data: @articles}, status: :ok
			end

			def show
				@article = Article.find(params[:id])
				render json: { status: 'SUCCESS', message: 'Loaded Article', data: @article}, status: :ok
			end

			def create
				@article = Article.new(article_params)

				if @article.save
					render json: { status: 'SUCCESS', message: 'Saved Article', data: @article}, status: :ok
				else
					render json: { status: 'ERROR', message: 'Article Not Found', 
						data: @article.error}, status: :unprocessable_entity
				end
			end

			def destroy
				@article = Article.find(params[:id])
				@article.destroy
				render json: { status: 'SUCCESS', message: 'Delete Article', data: @article}, status: :ok
			end

			def update
				@article = Article.find(params[:id])

				if @article.update(article_params)
					render json: { status: 'SUCCESS', message: 'Updated Article', data: @article}, status: :ok
				else
					render json: { status: 'ERROR', message: 'Article Not Updated', 
						data: @article.error}, status: :unprocessable_entity
				end
			end
			
			private
			def article_params
				params.permit(:title, :body)
			end
		end
	end
end
