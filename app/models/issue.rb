require 'net/https'
require 'open-uri'

class Issue < ActiveRecord::Base
  has_many   :comments
  belongs_to :milestone

  def self.get_issues(milestone_id)
    url = URI.parse('https://api.github.com/repos/tborisova/fridment/issues?labels=enhancement')
    header = { 'Accept' => 'application/vnd.github.v3+json' }

    connection = Net::HTTP.new(url.host, url.port)
    connection.use_ssl = true

    request = Net::HTTP::Get.new(url.request_uri, header)
    response = connection.request(request)
  
    if response.code == "200"
      issues = JSON.parse(response.body)
      issues.each do |issue|
        Issue.create(milestone_id: milestone_id,
                     assignee_name: issue['assignee'],
                     issue_url: issue['url'],
                     name: issue['title'],
                     description: issue['body'],
                     number: issue['number'])
      end
    end
  end
end