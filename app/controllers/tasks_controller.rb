class TasksController < ApplicationController
	respond_to :html, :js
	before_action :set_task, except: [:create]

	def create
	    @project = Project.find(params[:project_id])
	    @task = @project.tasks.create(task_params)
	    @task.save

	    respond_to do |format|
	  	    format.js
	    end
	  end
	  
 def sort
    params[:order].each do |key,value|
      Task.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end

	def destroy
		@task = Task.find(params[:id])
	    @task.destroy
	    respond_to do |format|
	    	format.js
		end
	end
	def update
		@task = Task.find(params[:id])
	    respond_to do |format|
	      if @task.update(task_params)
	        format.html { redirect_to @task, notice: 'task was successfully updated.' }
	        format.json { respond_with_bip(@task) }
	      else
	        format.html { render :edit }
	        format.json { respond_with_bip(@task) }
	      end
	    end
	end
	    def edit
	    	@task = Task.find(params[:id])
		  end
		def complete
			
			@task.update_attribute(:completed_at, Time.now)
			redirect_to root_path
		end

	  



	  private

	  def set_task
	  	 @task = Task.find(params[:id])
	  	end
	  	

	    def task_params
		    params.require(:task).permit!
		end
end
