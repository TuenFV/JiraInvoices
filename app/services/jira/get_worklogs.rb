module Jira
  class GetWorklogs
    def initialize(organization)
      @organization = organization
    end

    def perform
      Issue.find_each do |this_issue|
        endpoint = "issue/#{this_issue.jira_issue_id}/worklog"
        worklogs = Jira::FetchResource.new(@organization,endpoint).perform[:worklogs]

        unless worklogs.empty?
          worklogs.each do |jira_worklog|
            worklog = this_issue.worklogs.find_or_initialize_by(jira_worklog_id: jira_worklog[:id])

            worklog.timeSpent  = jira_worklog[:timeSpentSeconds]
            worklog.startTime  = jira_worklog[:started]
            worklog.updateTime = jira_worklog[:updated]
            worklog.user_id    = User.find_by_account_id(jira_worklog[:author][:accountId]).id

            worklog.save
          end
        end
      end
    end
  end
end

# Jira::GetWorklogs.new(Organization.first).perform

