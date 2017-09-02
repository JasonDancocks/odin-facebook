class FriendshipsController < ApplicationController
  def create
  	@friendship = current_user.friendships.build(friend_id: params[:friend_id])
  	if @friendship.save
  		flash[:notice] = "Friend requested."
  		redirect_to :back
  	else
  		flash[:error] = "Unable to request friendship"
  		redirect_to :back
  	end
  end

  def update
  end

  def destroy
  end
end
