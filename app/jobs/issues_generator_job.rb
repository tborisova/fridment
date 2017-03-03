class IssuesGeneratorJob < ApplicationJob
  queue_as :default

  def perform(date_from, date_to, milestone_id)
    url = URI.parse("#{Settings.project.url}?labels=#{Settings.project.label}")
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
