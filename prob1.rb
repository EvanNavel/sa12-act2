require 'httparty'

def fetch_repos(username)
  response = HTTParty.get("https://api.github.com/users/#{username}/repos")
  response.parsed_response
end

def find_top_repo(repos)
  repos.max_by { |repo| repo['stargazers_count'] }
end

username = "EvanNavel"
repos = fetch_repos(username)
top_repo = find_top_repo(repos)

puts "The most popular repository is:"
puts "Name: #{top_repo['name']}"
puts "Description: #{top_repo['description']}"
puts "Stars: #{top_repo['stargazers_count']}"
