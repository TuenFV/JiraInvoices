module Jira
  class GetUsers
    def initialize(organization)
      @organization = organization
    end

    def perform
      jira_users = Jira::FetchResource.new(@organization,"users").perform

      jira_users.each do |jira_user|
        if jira_user[:accountType] == "atlassian"
          user = @organization.users.find_or_initialize_by(account_id: jira_user[:accountId])

          user.name = jira_user[:displayName]
          user.email = jira_user[:emailAddress]
          user.active = jira_user[:active]

          user.save
        end
      end
    end
  end
end

# Jira::GetUsers.new(Organization.first).perform
