class FatigueController < ApplicationController
  
  def new

  	if params[:key].nil?
  		redirect_to '/'
  	else

      [user_id, date] = Base64::decode64(params[:key]).split('/')

  		@user = User.find(user_id)
  		@user_weight = UserWeight.new

  	end

  end

  def create
  end
end
