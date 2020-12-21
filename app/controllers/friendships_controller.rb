class FriendshipsController < ApplicationController
  def index
    @user = current_user
    @friends = @user.friends
    @requests = @user.requested_friends
    @pending = @user.pending_friends
  end


  def create
    @user = current_user
    friend = User.find_by(params[:id])
    @user.friend_request(friend)

    redirect_to root_path
  end

  def add
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.accept_request(friend)

    redirect_to root_path
  end
end
