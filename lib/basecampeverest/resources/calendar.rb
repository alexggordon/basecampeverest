module Basecampeverest; class Calendar

	    # find all calendars via the Basecamp API
	    # 
	    # @return [Basecampeverest::Project] an array of all the calendars from the Basecamp API
	    def self.all
	        url = "/calendars.json"
	        response = Basecampeverest::Connect.get url

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    #  a specific calendar via the Basecamp API
	    # 
	    # @param [Basecampeverest::Project] calendar_id the id of the calendar
	    # @return [Basecampeverest::Project] an array of the calendar information from the Basecamp API
	    def self.find(calendar_id)
	        url = "/calendars/#{calendar_id}.json"
	        response = Basecampeverest::Connect.get url

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # create a calendar via the Basecamp API
	    # 
	    # 
	    # @param [Basecampeverest::Project] options a hash that contains the array of the name of the calendar to be created
	    # @return [Basecampeverest::Project] the info of the calendar created from the Basecamp API
	    def self.new(options={})
	        post_params = {
	          :body => options.to_json,
	          :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
	        }
	        # make the http basecamp call
	        url = "/calendars.json"
	        response = Basecampeverest::Connect.post url, post_params

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # update a calendar via the Basecamp API
	    # 
	    # @param [Basecampeverest::Project] calendar_id the id of the calendar
	    # @return [Basecampeverest::Project] the created calendar from the Basecamp API
	    def self.update(calendar_id)
	        post_params = {
	          :body => options.to_json,
	          :headers => Basecampeverest::Connect.merge({'Content-Type' => 'application/json'})
	        }

	        # make the http basecamp call
	        url = "/calendars/#{calendar_id}.json"
	        response = Basecampeverest::Connect.put url, post_params

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # delete a calendar via the Basecamp API
	    # 
	    # @param [Basecampeverest::Project] calendar_id the id of the calendar
	    # @return [Basecampeverest::Project] a message with successful or unsuccessful deletion
	    def self.delete(calendar_id)
	    	url = "/calendars/#{calendar_id}.json"
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