require 'net/http'
require 'uri'

module Jira
  class FetchResource
    def initialize(organization,resource)
      # https://tuenfv.atlassian.net/rest/api/3/project
      @url = "https://#{organization}.atlassian.net/rest/api/3/#{resource}"
    end

    def perform
      username = ENV['JIRA_USERNAME']
      password = ENV['JIRA_PASSWORD']
      uri = URI.parse(@url)
      request = Net::HTTP::Get.new(uri)
      request.basic_auth(username, password)
      request.content_type = 'application/json'

      req_options = {
        use_ssl: uri.scheme == 'https'
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
