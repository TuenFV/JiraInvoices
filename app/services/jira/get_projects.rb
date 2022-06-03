module Jira
  class GetProjects
    def initialize
      jira_projects = Jira::FetchResource.new('project').perform
      organization_jira = jira_projects[0][:self].split('/')[2].split('.')[0]

      jira_projects.each do |jira_project|
        project = Project.find_or_initialize_by(jira_project_id: jira_project[:id])

        project.name = jira_project[:name]
        project.code = jira_project[:key]
        project.organization_id = Organization.find_by_domain(organization_jira).id

        if project.save
          puts "Project #{project.name} was updated from Jira!"
        else
          puts "Updating project #{project.name} from Jira failed!"
        end
      end
    end
  end
end
