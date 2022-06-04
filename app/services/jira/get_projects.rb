module Jira
  class GetProjects
    def initialize(organization)
      @organization = organization
    end

    def perform
      jira_projects = Jira::FetchResource.new("#{@organization}","project").perform

      jira_projects.each do |jira_project|
        project = Project.find_or_initialize_by(jira_project_id: jira_project[:id])

        project.name = jira_project[:name]
        project.code = jira_project[:key]
        project.organization_id = Organization.find_by_domain(@organization).id

        project.save
      end
    end
  end
end

# Jira::GetProjects.new("tuenfv").perform
