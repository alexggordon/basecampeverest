module Basecampeverest; class Comment
	    # This is the comment class. To get all the comments for a project, please see the Topic section.   
	    # Comments is kind of a complicated section because there are so many things that you can comment on. In short, there is one big method for a comment called
	    # through Basecampeverest::Comment::New(project_id, section, options={} )

	    # create a comment via the Basecamp API
	    # 
	    # @param [Basecampeverest::Project] project_id the project id of the basecamp project to create a comment
	    # @param [Basecampeverest::Project] section the section you would like to post to. There are a limited number of valid inputs, including messages, todos, todolists, 
	    # and events
	    # @param [Basecampeverest::Project] **OPTIONAL** content_id the ID of the content you would like to post to. 
	    # For example, a TODO list has an Idenitifier, so to post a comment on a 
	    # todo list you would pass in Basecampeverest::Comment::New(project_id, :section => "todolists", options={:content_id => "1", } )
	    # @return [Basecampeverest::Project] a hash of the comment details from the Basecamp API
	    def self.new(project_id, section, content_id, options={})
	        post_params = {
	          :body => options.to_json,
	          :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
	        }
	        # make the http basecamp call
	        url = "/projects/#{project_id}/#{section}/#{content_id}/comments.json"
	        response = Basecampeverest::Connect.post url, post_params

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # attatch a file to a comment via the Basecamp API
	    # 
	    # @return [Basecampeverest::Project] #### from the Basecamp API
	    def self.attach_file()
	        url = 
	        response = Basecampeverest::Connect.get url

	        # parse the response to remove HTTParty info
	        response.parsed_response
	    end

	    # delete a comment via the Basecamp API. All comments are deleted through here despite where they were posted (todolists, projects, messages etc... 
	    # 
	    # @param [Basecampeverest::Project] project_id the project id of the basecamp project to delete a comment
	    # @param [Basecampeverest::Project] comment_id the id of the basecamp comment to delete 
	    # @return [Basecampeverest::Project] ####
	    def self.delete(project_id, comment_id)
	        url = "/projects/#{project_id}/comments/1.json"
	        response = Basecampeverest::Connect.delete url

	        # This checks the response code for validity and error checking
	        if response.code == 204
	            message = comment successfully deleted"
	        elsif response.code == 403
	            message = "You do not have permission to delete this comment
	        else 
	            message = "Invalid comment ID or authentication. The #### was not deleted."
	        end

	        # return the message
	        message
	    end

	# end module and class
end; end