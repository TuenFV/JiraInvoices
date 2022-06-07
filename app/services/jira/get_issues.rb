module Jira
  class GetIssues
    def initialize(organization)
      @organization = organization
    end

    def perform
      @organization.projects.find_each do |this_project|
        n = (Jira::FetchResource.new(@organization,"search?jql=project=#{this_project.code}&maxResults=0").perform[:total]/100.0).ceil

        n.times do |i|
          endpoint = "search?jql=project=#{this_project.code}&fields=id,key,summary,timespent,assignee,status&maxResults=100&startAt=#{100*i}"

          jira_issues = Jira::FetchResource.new(@organization,endpoint).perform[:issues]

          jira_issues.each do |jira_issue|
            issue = this_project.issues.find_or_initialize_by(jira_issue_id: jira_issue[:id])

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
  end
end

# FetchIssue
# https://tuenfv.atlassian.net/rest/api/3/search?jql=project=JI&fields=id,key,summary,timespent,assignee&maxResults=100

# Jira::GetIssues.new(Organization.first).perform
