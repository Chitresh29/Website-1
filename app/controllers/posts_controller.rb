class PostsController < ApplicationController
	before_action :find_posts, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin!, except: [:index, :show]
	def index
		@post = Post.all.order('created_at desc')
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params
		if @post.save
			redirect_to @post, notice: "Saved"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update post_params
			redirect_to @post, notice: "Updated"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		render 'posts/index'
	end

	private

	def find_posts
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end
end
