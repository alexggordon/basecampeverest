module Basecampeverest; class TodoItem

	# To find all the todo items, use the TodoList class.
	# Running Basecampeverest::TodoList.find(project_id, todo_list_id)
	# will return all todo items for a project. 

	# find a specific todo via the Basecamp API
	# 
	# @param [Basecampeverest::TodoItem] project_id 
	# @param [Basecampeverest::TodoItem] todo_id 
	# @return [Basecampeverest::TodoItem] all todo lists for all projects from the Basecamp API
	def self.find(project_id, todo_id)
		url = "projects/#{project_id}/todos/#{todo_id}.json"
	    response = Basecampeverest::Connect.get url

	    # parse the response to remove HTTParty info
	    response.parsed_response
	end

	# create a todo via the Basecamp API
	# 
	# @param [Basecampeverest::TodoItem] project_id the project id of the todo to create
	# @param [Basecampeverest::TodoItem] todolist_id the todolist_id of the todo to be created
	# @return [Basecampeverest::TodoItem] all todo lists for all projects from the Basecamp API
	def self.new(project_id, todolist_id, options={})
		post_params = {
		  :body => options.to_json,
		  :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
		}
		url = "/projects/#{project_id}/todolists/#{todolist_id}/todos.json"
		# make the http basecamp call
		response = Basecampeverest::Connect.post url, post_params

		# parse the response to remove HTTParty info
		response.parsed_response
	end

	# update a specific todo via the Basecamp API
	# 
	# @param [Basecampeverest::TodoItem]  project_id the project id of the todo to update
	# @param [Basecampeverest::TodoItem] todo_id the id of the todo to update
	# @param [Basecampeverest::Project] options the details of the updated todo  
	# @return [Basecampeverest::TodoItem] all todo lists for all projects from the Basecamp API
	def self.update(project_id, todo_id, options={})
		post_params = {
		  :body => options.to_json,
		  :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
		}
		url = "/projects/#{project_id}/todos/#{todo_id}.json"
		# make the http basecamp call
		response = Basecampeverest::Connect.put url, post_params

		# parse the response to remove HTTParty info
		response.parsed_response
	end

	# delete a specific todo via the Basecamp API
	# 
	# @param [Basecampeverest::TodoItem]  project_id the project id of the todo to update
	# @param [Basecampeverest::TodoItem] todo_id the id of the todo to update
	# @return [Basecampeverest::TodoItem] a message with the result from the Basecamp API
	def self.delete(project_id, todo_id)
	    # for some reason ruby won't put in the project ID for a delete method. Solved by setting the url
	    # and then calling delete
	    url = "/projects/#{project_id}/todos/#{todo_id}.json"
	    response = Basecampeverest::Connect.delete url

	    # This checks the response code for validity and error checking
	    if response.code == 204
	        message = "Todo successfully deleted"
	    elsif response.code == 403
	        message = "You do not have permission to delete this todo"
	    else 
	        message = "Invalid project ID or authentication. The todo was not deleted."
	    end

	    # return the message
	    message
	end

end; end