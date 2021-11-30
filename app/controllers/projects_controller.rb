class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
    #render json: @projects
  end

  def new
    @project = Project.new
    @project.to_dos.new
  end

  def show; end

  def create 
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
      flash[:notice] = "Задача успешно сохранена"
    else
      render :new
      flash[:notice] = "Задача не сохранилась"
    end
  end

  def edit; end 

  def update
    @project.update(project_params)  
  end

  def destroy
    if @project.delete
      redirect_to projects_path
      flash[:notice] = "Задача успешно удалена"
    else
      flash[:notice] = "Задача не удалена"
    end

  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, to_dos_attributes: [:id, :text, :is_completed, :_destroy])
  end

end
