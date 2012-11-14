class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]
  def new
  	@user = User.new		# create a new user for this session
  end

  def create
  	respond_to do |format|
  		if @user = login(params[:username], params[:password])
        session[:user_id] = @user.id
  			format.html { redirect_back_or_to(:users, :notice => "Login Successful")}
  			format.xml { render :xml => @user, :status => :created, :location => @user }
  		else
  			format.html { flash.now[:alert] = "Login Failed"; render :action => "new" }
  			format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
  		end
  	end
  end

  def destroy
  	logout
  	redirect_to(root_path, :notice => 'Logged out!')
  end
end
