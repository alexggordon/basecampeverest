module Basecampeverest; class Message
	    #Messages are closely related with topics so there is no .all method.  

	    # Get a specific message via the Basecamp API
	    # 
	    # @param [Basecampeverest::Project] project_id the project id of the basecamp project
	    # @return [Basecampeverest::Project] an array of the specific message info from the Basecamp API
	    def self.find(project_id, message_id)
	        url = "/projects/#{project_id}/messages/#{message_id}.json"
	        response = Basecampeverest::Connect.get url

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # create a new message via the Basecamp API
	    # 
	    # 
	    # @param [Basecampeverest::Project] project_id
	    # @param [Basecampeverest::Project] options a hash containing the infomation of the message to be created. 
	    # @return [Basecampeverest::Project] an array with the information of the created message from the Basecamp API
	    def self.new(project_id, options={})
	        post_params = {
	          :body => options.to_json,
	          :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
	        }
	        # make the http basecamp call
	        url = "/projects/#{project_id}/messages.json"
	        response = Basecampeverest::Connect.post url, post_params

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # attach a file to a message via the Basecamp API
	    # 
	    # 
	    # @param [Basecampeverest::Project] project_id
	    # @param [Basecampeverest::Project] options a hash containing the infomation of the message to be created. 
	    # @return [Basecampeverest::Project] an array with the information of the created message from the Basecamp API
	    def self.attach_file(project_id, options={})
	        post_params = {
	          :body => options.to_json,
	          :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
	        }
	        # make the http basecamp call
	        url = "/projects/#{project_id}/messages.json"
	        response = Basecampeverest::Connect.post url, post_params

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # update a message via the Basecamp API
	    # 
	    # @param [Basecampeverest::Project] project_id
	    # @param [Basecampeverest::Project] options a hash containing the infomation of the message to be created. 
	    # @return [Basecampeverest::Project] an array with the information of the created message from the Basecamp API
	    def self.update(project_id, message_id, options={})
	        post_params = {
	          :body => options.to_json,
	          :headers => Basecampeverest::Connect.merge({'Content-Type' => 'application/json'})
	        }

	        # make the http basecamp call
	        url = "/projects/#{project_id}/messages/#{message_id}.json"
	        response = Basecampeverest::Connect.put url, post_params

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end


	    # delete via the Basecamp API
	    # 
	    # @param [Basecampeverest::Project] project_id
	    # @param [Basecampeverest::Project] options a hash containing the infomation of the message to be created. 
	    # @return [Basecampeverest::Project] an array with the information of the created message from the Basecamp API
	    def self.delete(project_id, message_id)
 	   	url = "/projects/#{project_id}/messages/#{message_id}.json"
	            response = Basecampeverest::Connect.delete url

	        # This checks the response code for validity and error checking
	        if response.code == 204
	            message = "#### successfully deleted"
	        elsif response.code == 403
	            message = "You do not have permission to delete this ####"
	        else 
	            message = "Invalid project ID or authentication. The #### was not deleted."
	        end

	        # return the message
	        message
	    end

	# end module and class
end; end