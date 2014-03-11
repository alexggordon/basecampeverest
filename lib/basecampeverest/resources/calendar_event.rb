module Basecampeverest; class CalendarEvents

	    # find all #### via the Basecamp API
	    # 
	    # @return [Basecampeverest::Project] #### from the Basecamp API
	    def self.all
	        url = 
	        response = Basecampeverest::Connect.get 

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # #### via the Basecamp API
	    # 
	    # @param [Basecampeverest::Project] project_id
	    # @return [Basecampeverest::Project] #### from the Basecamp API
	    def self.find(project_id)
	        url = "/projects/#{project_id}/calendar_events.json"
	        response = Basecampeverest::Connect.get url
	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # #### via the Basecamp API
	    # 
	    # @param [Basecampeverest::Project] project_id
	    # @param [Basecampeverest::Project] project_id
	    # @return [Basecampeverest::Project] #### from the Basecamp API
	    def self.find_specific(project_id, event_id)
	        url = "/projects/#{project_id}/calendar_events/#{event_id}.json"
	        response = Basecampeverest::Connect.get url

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # #### via the Basecamp API
	    # 
	    # 
	    # @param [Basecampeverest::Project] ####
	    # @param [Basecampeverest::Project] ####
	    # @return [Basecampeverest::Project] #### from the Basecamp API
	    def self.new_project_event(project_id, options={})
	        post_params = {
	          :body => options.to_json,
	          :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
	        }
	        # make the http basecamp call
	        url = "/projects/#{project_id}/calendar_events.json"
	        response = Basecampeverest::Connect.post url, post_params

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # #### via the Basecamp API
	    # 
	    # 
	    # @param [Basecampeverest::Project] ####
	    # @param [Basecampeverest::Project] ####
	    # @return [Basecampeverest::Project] #### from the Basecamp API
	    def self.new_calendar_event(options={})
	        post_params = {
	          :body => options.to_json,
	          :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
	        }
	        # make the http basecamp call
	        url = "/projects/1/calendar_events.json"
	        response = Basecampeverest::Connect.post url, post_params

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end



	    # #### via the Basecamp API
	    # 
	    # @param [Basecampeverest::Project] ####
	    # @param [Basecampeverest::Project] #### 
	    # @return [Basecampeverest::Project]  from the Basecamp API
	    def self.update()
	        post_params = {
	          :body => options.to_json,
	          :headers => Basecampeverest::Connect.merge({'Content-Type' => 'application/json'})
	        }

	        # make the http basecamp call
	        url = 
	        response = Basecampeverest::Connect.put url, post_params

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end


	    # #### via the Basecamp API
	    # 
	    # @param [Basecampeverest::Project] ####
	    # @return [Basecampeverest::Project] ####
	    def self.delete()
	        url = "####"
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