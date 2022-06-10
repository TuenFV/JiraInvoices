# Create Organizations: tuenfv, duyetvn, test123
Organization.create([
  {domain: "tuenfv"},
  {domain: "duyetvn"},
  {domain: "test123"}])

@organization = Organization.find_by_domain("tuenfv")

# Get Projects from Jira of organization "tuenfv".
Jira::GetProjects.new(@organization).perform

# Get Users from Jira
Jira::GetUsers.new(@organization).perform

# Get Issues from Jira
Jira::GetIssues.new(@organization).perform

# Get Worklogs
Jira::GetWorklogs.new(@organization).perform
