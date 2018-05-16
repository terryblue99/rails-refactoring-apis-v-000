class RepositoriesController < ApplicationController

  def index

  	# repos_resp = Faraday.get "https://api.github.com/user/repos", {}, 
	  # 	{'Authorization' => "token #{session[:token]}", 
	  # 	'Accept' => 'application/json'}

	github = GithubService.new

	@repos_array = github.get_repos  	

  end


  def create

  	@repos_response = Faraday.post "https://api.github.com/user/repos", 
	  	{name: params[:name]}.to_json, 
	  	{'Authorization' => "token #{session[:token]}", 
	  	'Accept' => 'application/json'}

	redirect_to root_path

  end

end

# def get_repos
# 	response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{self.access_token}", 'Accept' => 'application/json'}
# 	repos_array = JSON.parse(response.body)
# 	repos_array.map{|repo| GithubRepo.new(repo) }
# end

# def create_repo(name)
# 	Faraday.post "https://api.github.com/user/repos", {name: name}.to_json, {'Authorization' => "token #{self.access_token}", 'Accept' => 'application/json'}
# end