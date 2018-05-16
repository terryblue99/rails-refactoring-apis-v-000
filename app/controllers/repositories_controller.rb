class RepositoriesController < ApplicationController

  def index

	github = GithubService.new

	@repos_array = github.get_repos  	

  end


  def create

  	# @repos_response = Faraday.post "https://api.github.com/user/repos", 
	  # 	{name: params[:name]}.to_json, 
	  # 	{'Authorization' => "token #{session[:token]}", 
	  # 	'Accept' => 'application/json'}

	github = GithubService.new

	github.create_repo(params[:name])

	redirect_to root_path

  end

end

# def create_repo(name)
# 	Faraday.post "https://api.github.com/user/repos", {name: name}.to_json, {'Authorization' => "token #{self.access_token}", 'Accept' => 'application/json'}
# end