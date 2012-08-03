class FatigueController < ApplicationController
  
  def new

  	if params[:key].nil?
  		redirect_to '/'
  	else

      email = Base64::decode64(params[:key]).split('/')[0]
      @date = Base64::decode64(params[:key]).split('/')[1]

  		@user = User.where(email: email).first
  		@user_weight = UserWeight.new

  	end

  end

  def create
  end
end
