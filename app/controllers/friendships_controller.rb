class FriendshipsController < ApplicationController
    def create
        @user = current_user
        friend = User.find_by(params[:id])
        @user.friend_request(User.find_by(id: params[:id]))
    end
end
