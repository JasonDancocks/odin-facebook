class CommentsController < ApplicationController

	def create
		@comment = current_user.comments.build(post_id: params[:post_id], body: params[:body])
		if @comment.save!
			flash[:notice] = "Comment Posted!"
			redirect_back fallback_location: root_url
		else
			flash[:error] = "Unable to post comment"
			redirect_back fallback_location: root_url
		end
	end

	def update
	end


	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		flash[:notice] = "Removed comment."
		redirect_back fallback_location: root_url
	end
end

