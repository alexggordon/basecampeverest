module Basecampeverest; class TodoList

	# find all todo lists via the Basecamp API
	# 
	# @return [Basecampeverest::TodoList] all projects from the Basecamp API
	def self.all
	    response = Basecampeverest::Connect.get "/projects.json"

	    # parse the response to remove HTTParty info
	    response.parsed_response
	end


 def find(project_identification_number, todo_list_id)
   url = "/projects/#{project_identification_number}/todolists/#{todo_list_id}.json"
   response = self.class.get url
   
   response.parsed_response.map do |h| 
     
     # grab the project ID for this list from the url
     list.project_id = project_identification_number
     
     # return the list so this method returns an array of lists
     list
   end
 end

end; end