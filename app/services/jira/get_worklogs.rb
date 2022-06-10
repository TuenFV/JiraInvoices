module Jira
  class GetWorklogs
    def initialize(organization)
      @organization = organization
    end

    def perform
      Issue.all.each do |issue|
        endpoint = "issue/#{issue.key}/worklog"
        response_worklogs = Jira::FetchResource.new(@organization,endpoint).perform
        response_worklogs[:worklogs].each do |jira_worklog|
          worklog = issue.worklogs.find_or_initialize_by(jira_worklog_id: jira_worklog[:id])
          worklog.timeSpent  = jira_worklog[:timeSpentSeconds]
          worklog.startTime  = jira_worklog[:started]
          worklog.jira_author_account_id = jira_worklog[:author][:accountId]
          worklog.save
        end
      end
    end
  end
end
