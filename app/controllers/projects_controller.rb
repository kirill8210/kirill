class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @project = Project.new

    end   

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.create(project_params)
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
 def edit

end
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'project was successfully updated.' }
        format.json { respond_with_bip(@project) }
      else
        format.html { render :edit }
        format.json { respond_with_bip(@project) }
      end
    end
  end
  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_with @project
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name)
    end
end
