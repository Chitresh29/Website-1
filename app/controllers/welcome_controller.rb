class WelcomeController < ApplicationController
	def index
		@post = Post.order('created_at desc').first('3')
	end
end
