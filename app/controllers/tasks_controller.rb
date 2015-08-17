class TasksController < ApplicationController

	def create
	    @project = Project.find(params[:project_id])
	    @task = @project.tasks.create(task_params)
	    @task.save

	    respond_to do |format|
	  	    format.js
	    end
	  end

	def destroy
		@task = Task.find(params[:id])
	    @task.destroy
	    respond_to do |format|
	    	format.js
		end
	end
	    def edit
	    	@task = Task.find(params[:id])
		  end

		  def update
		  	@task = Task.find(params[:id])
		   
		      if @task.update(task_params)
		       redirect_to :root
		  end
		  end
	  def sort
	    params[:order].each do |key,value|
	      Task.find(value[:id]).update_attribute(:priority,value[:position])
	    end
	    render :nothing => true
	  end



	  private

	    def task_params
		    params.require(:task).permit!
		end
end
