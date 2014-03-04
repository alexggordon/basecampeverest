module Basecampeverest; class TodoItem

	# To find all the todo items, use the TodoList class.
	# Running Basecampeverest::TodoList.find(project_id, todo_list_id)
	# will return all todo items for a project. 

	# find a specific todo via the Basecamp API
	# 
	# @param [Basecampeverest::TodoItem]
	# @return [Basecampeverest::TodoItem] all todo lists for all projects from the Basecamp API
	def self.find(project_id, todo_id)
		url = "projects/#{project_id}/todos/#{todo_id}.json"
	    response = Basecampeverest::Connect.get url

	    # parse the response to remove HTTParty info
	    response.parsed_response
	end

	# find a specific todo via the Basecamp API
	# 
	# @param [Basecampeverest::TodoItem]
	# @return [Basecampeverest::TodoItem] all todo lists for all projects from the Basecamp API
	def self.new(project_id, todo_id, options={})
		post_params = {
		  :body => options.to_json,
		  :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
		}
		url = "/projects/#{project_id}/todolists/#{todo_id}/todos.json"
		# make the http basecamp call
		response = Basecampeverest::Connect.post url, post_params

		# parse the response to remove HTTParty info
		response.parsed_response
	end

end; end