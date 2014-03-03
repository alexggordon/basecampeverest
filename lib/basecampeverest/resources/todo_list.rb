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
	# @return [Basecampeverest::TodoList] all todo lists for all projects from the Basecamp API
	def self.all_completed
		response = Basecampeverest::Connect.get "/todolists/completed.json"

		# parse the response to remove HTTParty info
		response.parsed_response
	end

	# find all todo lists via the Basecamp API
	# 
	# @param [Basecampeverest::TodoList] project_id
	# @return [Basecampeverest::TodoList] all completed todo lists for a project from the Basecamp API
	def self.find_completed(project_id)
		url = "/projects/#{project_id}/todolists/completed.json"
		response = Basecampeverest::Connect.get url

		# parse the response to remove HTTParty info
		response.parsed_response
	end	


	# find all todo_lists for a specific project via the Basecamp API
	# 
	# @param [Basecampeverest::TodoList] project_id
	# @param [Basecampeverest::TodoList] todo_list_id
	# @return [Basecampeverest::TodoList] all todo lists for all projects from the Basecamp API
	def self.find(project_id, todo_list_id)
		url = "/projects/#{project_id}/todolists/#{todo_list_id}.json"
		response = self.class.get url

		# parse the response to remove HTTParty info
		response.parsed_response
	end

	

	def self.delete(project_id, todo_list_id)
		
	end
# end module and class
end; end