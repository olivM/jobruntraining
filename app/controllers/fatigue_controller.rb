class FatigueController < ApplicationController
  
  def new

  	if params[:key].nil?
  		redirect_to '/'
  	else

  		@user = User.first
  		@user_weight = UserWeight.new

  	end

  end

  def create
  end
end
