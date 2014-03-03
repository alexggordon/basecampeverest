module Basecampeverest; class TodoItem

	# To find all the todo items, use the TodoList class.
	# Running Basecampeverest::TodoList.find(project_id, todo_list_id)
	# will return all todo items for a project. 

	# find a specific todo via the Basecamp API
	# 
	# @param [Basecampeverest::TodoItem]
	# @return [Basecampeverest::TodoItem] all todo lists for all projects from the Basecamp API
	def self.find(project_id, todo_id)
	    response = Basecampeverest::Connect.get "/todolists.json"

	    # parse the response to remove HTTParty info
	    response.parsed_response
	end

end; end