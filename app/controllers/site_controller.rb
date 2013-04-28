class SiteController < ApplicationController
before_filter :authorize, :except => [:index, :login]

  def index
    current_user
  end

  def login
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      
      redirect_to root_url
    else
      flash.now.alert = "Invalid email or password"
      render "index"
    end
  end

  def logout
    session[:user_id] = nil
    
    redirect_to root_url
  end
end

def authorise
	unless current_user
		redirect_to root_url
	end
end
