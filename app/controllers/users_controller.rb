class UsersController < ApplicationController
  def new
    @token = params[:invite_token]
  end

  def create
    @newUser = User.new(user_params)
    @newUser.save
    @token = params[:invite_token]
    if @token != nil
       trip =  Invite.find_by_token(@token).user_trip
       @newUser.user_trips.create({trip_id: trip.id, role: 'contributor'})
    else
      # do normal registration things #
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :profile_pic,
      :password, 
      :password_confirmation
    )
  end


end
