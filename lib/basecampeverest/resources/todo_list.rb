module Basecampeverest; class TodoList


 def located_todo(project_identification_number, todo_list_id)
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