class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  # def home
  #   @players = User.all
  #   @user = current_user
  #   @friends = @user.friends
  #   @requests = @user.requested_friends
  #   @pending = @user.pending_friends
  # end

end
