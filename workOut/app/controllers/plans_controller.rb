class PlansController < ApplicationController
  # GET /plans
  # GET /plans.json
  def index
    @user = User.find(params[:user_id])                     # find the current user in session
    @plans = Plan.find_all_by_user_id(@user.id)             # find the ALL the plans by this user
    respond_to do |format|
      format.html # index.html.erb                          # render the html page
      format.json { render json: @plans }
    end
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    @user = User.find(session[:user_id])                      # find the current user
    @plan = Plan.find(params[:id])                            # find the current plan owned the current user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plan }
    end
  end

  # GET /plans/new
  # GET /plans/new.json
  def new
    @user = User.find(params[:user_id])                       
    @plan = Plan.new(:user_id => @user.id )

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plan }
    end
  end

  # GET /plans/1/edit
  def edit
    @plan = Plan.find(params[:id])
  end

  # POST /plans
  # POST /plans.json
  def create
    @user = User.find(session[:user_id])
    @plan = Plan.new

    @plan.user_id = @user.id
    if @plan.update_attributes(params[:plan])
      if @plan.save
        respond_to do |format|
          format.html { redirect_to @plan, :id => @plan.id, notice: 'Plan was successfully created.' }
          format.json { render json: @plan, status: :created, location: @plan }
        end
      else
          format.html { render action: "new" }
          format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plans/1
  # PUT /plans/1.json
  def update
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @user = User.find(session[:user_id])
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to user_plans_url(@user.id) }
      format.json { head :no_content }
    end
  end
end