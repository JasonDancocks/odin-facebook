class LikesController < ApplicationController
   def create
  	@like = current_user.likes.build(post_id: params[:post_id])
  	if @like.save
  		flash[:notice] = "Post Liked!"
  		redirect_back fallback_location: root_url
  	else
  		flash[:error] = "Unable to Like post"
  		redirect_back fallback_location: root_url
  	end
  end
  
 def destroy
      @like = Like.find_by(user_id: params[:user_id], post_id: params[:post_id])
      @like.destroy
      flash[:notice] = "Removed like."
      redirect_back fallback_location: root_url
    end
end
