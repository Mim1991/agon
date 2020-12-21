class FriendshipsController < ApplicationController
    def create
        @user = current_user
        friend = User.find_by(params[:id])
        @user.friend_request(friend)
        
        redirect_to root_path
    end
end
