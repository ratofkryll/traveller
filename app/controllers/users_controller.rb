class UsersController < ApplicationController
  def new
    @token = params[:invite_token]
  end
end
