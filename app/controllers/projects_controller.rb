class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def get_project_from_jira
    Jira::GetProjects.new
    redirect_to projects_path
    flash[:notice] = "Projects were updated from Jira!"
  end
end
