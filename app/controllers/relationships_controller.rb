class RelationshipsController < ApplicationController
 
  def create
    currrent_user.follw(params[:user_id])
    redirect_to request.referer
  end
  
  def destroy
    currrent_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
 
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
