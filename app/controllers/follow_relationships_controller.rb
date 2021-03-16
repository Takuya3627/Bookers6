class FollowRelationshipsController < ApplicationController

  def create
    @user = User.find(params[:follow_relationship][:following_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
    end
  end

  def destroy
    @user = User.find(params[:follow_relationship][:following_id])
    current_user.unfollow(@user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
    end
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

end
