module Jira
  class GetIssues
    def initialize(organization)
      @organization = organization
    end

    def perform
      @organization.projects.find_each do |project|
        start_at = 0
        max_result = 100
        loop do
          url = "search?jql=project=#{project.code}&maxResults=#{max_result}&startAt=#{start_at}"
          jira_issues_response = Jira::FetchResource.new(@organization, url).perform
          jira_issues = jira_issues_response[:issues]
          store_issue(jira_issues, project)
          break if start_at + max_result >= jira_issues_response[:total]

          start_at += 1
        end
      end
    end

    private

    def store_issue(jira_issues, project)
      jira_issues.each do |jira_issue|
        issue = project.issues.find_or_initialize_by(jira_issue_id: jira_issue[:id])
        issue.key       = jira_issue[:key]
        issue.summary   = jira_issue[:fields][:summary]
        issue.timespent = jira_issue[:fields][:timespent]
        issue.status    = jira_issue[:fields][:status][:name]
        issue.user_id   = User.find_by_account_id(jira_issue[:fields][:assignee].try(:[], :accountId)).try(:id)

        issue.save
      end
    end
  end
end
