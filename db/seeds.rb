# Create Organizations: tuenfv, duyetvn, test123
Organization.create([
  {domain: "tuenfv"},
  {domain: "duyetvn"},
  {domain: "test123"}])

@organization = Organization.find_by_domain("tuenfv")

User.create(name: "Not Assign Yet", organization_id: @organization.id)
# Get Projects from Jira which belongs to the first organization.
Jira::GetProjects.new(@organization).perform

# Get Users from Jira which belongs to the first organization.
Jira::GetUsers.new(@organization).perform

# Get Issues from Jira which belongs to the first organization.
Jira::GetIssues.new(@organization).perform
