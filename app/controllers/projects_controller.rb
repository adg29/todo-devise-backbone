class ProjectsController < ApplicationController
  def index
    @projects = Project.find(:all)
    
	respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @projects }
    end
  end

 def backbone
    @projects = Project.find(:all)
	respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @projects }
    end	
  end
  
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @project }
    end
  end
  
  def new
    @project = Project.new
    
	respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @project }
    end
  end
  
  def create
    # delete the action and controller params 
    # passed in by rails
    # TODO look for a smarter work around.
    # e.g. use rails form helpers and a namespaced 
    # entity of the params object
    proj_params = params
    proj_params.delete('action')
    proj_params.delete('controller')
    @project = Project.new(proj_params)
	logger.debug(params)
	respond_to do |format|
		if @project.save
		  format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
		  format.json  { render :json => @project, :status => :created, :location => @project }
		else
		  format.html { render :action => "new" }
		  format.json  { render :json => @project.errors, :status => :unprocessable_entity }
		end
	end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
	respond_to do |format|
		proj_params = params
		# there has to be a better way of
		# receiving the params than having o
		# delete the action and controller params 
		# passed in by rails
		proj_params.delete('action')
		proj_params.delete('controller')
		if @project.update_attributes(proj_params)
		  format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
		  format.json  { head :ok }
		else
		  format.html { render :action => "edit" }
		  format.json  { render :json => @project.errors, :status => :unprocessable_entity }
		end
	end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.json  { head :ok }
    end
  end
end
