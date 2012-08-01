class FatigueController < ApplicationController
  
  def new

  	if params[:key].nil?
  		redirect_to '/'
  	else

  		true

  	end

  end

  def create
  end
end
