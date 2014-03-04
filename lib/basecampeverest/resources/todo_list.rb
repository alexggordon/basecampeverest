module Basecampeverest; class TodoList

	# find all todo lists for all projects via the Basecamp API
	# 
	# @return [Basecampeverest::TodoList] all todo lists for all projects from the Basecamp API
	def self.all
	    response = Basecampeverest::Connect.get "/todolists.json"

	    # parse the response to remove HTTParty info
	    response.parsed_response
	end

	# find all completed todo lists for all projects via the Basecamp API
	# 
	# @return [Basecampeverest::TodoList] all completed todo lists for all projects from the Basecamp API
	def self.all_completed
		response = Basecampeverest::Connect.get "/todolists/completed.json"

		# parse the response to remove HTTParty info
		response.parsed_response
	end

	# find all project specific todo lists via the Basecamp API
	# 
	# @param [Basecampeverest::TodoList] project_id the project id of the project to get the todo lists from
	# @return [Basecampeverest::TodoList] all todo lists for a project from the Basecamp API
	def self.find_completed(project_id)
		url = "/projects/#{project_id}/todolists/completed.json"
		response = Basecampeverest::Connect.get url

		# parse the response to remove HTTParty info
		response.parsed_response
	end	


	# find all todo_lists for a specific project via the Basecamp API
	# 
	# @param [Basecampeverest::TodoList] project_id the project id of the project to get the todo lists from
	# @param [Basecampeverest::TodoList] todo_list_id the todo list id of the todo list to get the todo items from
	# @return [Basecampeverest::TodoList] all todo lists for all projects from the Basecamp API
	def self.find(project_id, todo_list_id)
		url = "/projects/#{project_id}/todolists/#{todo_list_id}.json"
		response = Basecampeverest::Connect.get url

		# parse the response to remove HTTParty info
		response.parsed_response
	end

	def self.for_project(project_id)
		url = "/projects/#{project_id}/todolists.json"
		response = Basecampeverest::Connect.get url

		# parse the response to remove HTTParty info
		response.parsed_response
	end

	# find all todo_lists assigned to a specific person via the Basecamp API
	# 
	# @param [Basecampeverest::TodoList] person_id the person id of the person to get the todo lists for
	# @return [Basecampeverest::TodoList]  all todo_lists assigned to a specific person from the Basecamp API
	def self.all_assigned(person_id)
		url = "/people/#{person_id}/assigned_todos.json"
		response = Basecampeverest::Connect.get url

		# parse the response to remove HTTParty info
		response.parsed_response
	end

	# create a todo_list via the Basecamp API
	# 
	# @param [Basecampeverest::TodoList] project_id the project id for the todo list to update
	# @param [Basecampeverest::TodoList] options={} a hash containing :name and :description for the new todo list
	# @return [Basecampeverest::TodoList] the new todo list info from the Basecamp API
	def self.new(project_id, options={})
	        # if options[:name].nil?
	        #     return "You need a project name"
	        # else
	            
	        # end
	    post_params = {
	      :body => options.to_json,
	      :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
	    }
	    url = "/projects/#{project_id}/todolists.json"
	    # make the http basecamp call
	    response = Basecampeverest::Connect.post url, post_params

	    # parse the response to remove HTTParty info
	    response.parsed_response
	end

	# update a todo_list via the Basecamp API
	# 
	# @param [Basecampeverest::TodoList] project_id the project id for the todo list to update
	# @param [Basecampeverest::TodoList] todo_list_id the todo list id for the todo list to update
	# @param [Basecampeverest::TodoList] options={} a hash containing :name and :description for the todo list
	# @return [Basecampeverest::TodoList] the new todo list info from the Basecamp API
	def self.update(project_id, todo_list_id, options={})
	    post_params = {
	      :body => options.to_json,
	      :headers => Basecampeverest::Connect.merge({'Content-Type' => 'application/json'})
	    }
	    url = "/projects/#{project_id}/todolists/#{todo_list_id}.json"
	    # make the http basecamp call
	    response = Basecampeverest::Connect.put url, post_params

	    # parse the response to remove HTTParty info
	    response.parsed_response
	end

	# delete a todo_list via the Basecamp API
	# 
	# @param [Basecampeverest::TodoList] project_id the project id for the todo list to delete
	# @param [Basecampeverest::TodoList] todo_list_id the todo list id for the todo list to delete
	# @return [Basecampeverest::TodoList] a message with the result of the delete from the Basecamp API
	def self.delete(project_id, todo_list_id)
		url = "/projects/#{project_id}/todolists/#{todo_list_id}.json"
		response = Basecampeverest::Connect.delete url

		# This checks the response code for validity and error checking
		if response.code == 204
		    message = "Todo List successfully deleted"
		elsif response.code == 403
		    message = "You do not have permission to delete this Todo List"
		else 
		    message = "Invalid project ID, todo list ID or authentication. The todo_list was not deleted."
		end

		# return the message
		message
	end

# end module and class
end; end