module Basecampeverest; class Project
    # find all projects via the Basecamp API
    # 
    # @return [Basecampeverest::Project] all projects from the Basecamp API
    def self.all
        response = Basecampeverest::Connect.get "/projects.json"

        # parse the response to remove HTTParty info
        response.parsed_response
    end

    # find a project via the Basecamp API
    # 
    # @param [Basecampeverest::Project] project_id the project id of the basecamp project
    # @return [Basecampeverest::Project] the found project information from the Basecamp API
    def self.find(project_id)
        response = Basecampeverest::Connect.get "/projects/#{project_id}.json"

        # parse the response to remove HTTParty info
        response.parsed_response
    end

    # create a project via the Basecamp API
    # the options hash must have the name and description element. 
    # 
    # @param [Basecampeverest::Project] options the name of the new basecamp project 
    # @param [Basecampeverest::Project] description the details of the new basecamp project 
    # @return [Basecampeverest::Project] the new project information from the Basecamp API
    def self.new(options={})
            # if options[:name].nil?
            #     return "You need a project name"
            # else
                
            # end
        post_params = {
          :body => options.to_json,
          :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
        }
        # make the http basecamp call
        response = Basecampeverest::Connect.post "/projects.json", post_params

        # parse the response to remove HTTParty info
        response.parsed_response
    end

    # update a project via the Basecamp API
    # 
    # @param [Basecampeverest::Project] project_id the project id of the basecamp project to change
    # @param [Basecampeverest::Project] options the details of the new basecamp project 
    # @return [Basecampeverest::Project] the project information from the Basecamp API
    def self.update(project_id, options={})
        post_params = {
          :body => {:name => name, :description => description}.to_json,
          :headers => Basecampeverest::Connect.merge({'Content-Type' => 'application/json'})
        }

        # make the http basecamp call
        response = Basecampeverest::Connect.put "/projects/#{project_id}.json"

        # parse the response to remove HTTParty info
        response.parsed_response
    end

    # archive a project via the Basecamp API
    # 
    # @param [Basecampeverest::Project] project_id the project id of the basecamp project to change
    # @return [Basecampeverest::Project] the project information from the Basecamp API
    def self.archive(project_id)
        post_params = {
          :body => {:archived => true}.to_json,
          :headers => Basecampeverest::Connect.merge({'Content-Type' => 'application/json'})
        }

        url = "/projects/#{project_id}.json"
        response = Basecampeverest::Connect.put url post_params

        # This checks the response code for validity and error checking
        if response.code == 200
            message = "Project successfully archived"
        elsif response.code == 403
            message = "You do not have permission to archive this project"
        else 
            message = "Invalid project ID or authentication. The project was not archived."
        end

        # return the message
        message
    end

    def self.activate(project_id)
        post_params = {
          :body => {:archived => false}.to_json,
          :headers => Basecampeverest::Connect.merge({'Content-Type' => 'application/json'})
        }

        url = "/projects/#{project_id}.json"
        response = Basecampeverest::Connect.put url post_params

        # This checks the response code for validity and error checking
        if response.code == 200
            message = "Project successfully activated"
        elsif response.code == 403
            message = "You do not have permission to activate this project"
        else 
            message = "Invalid project ID or authentication. The project was not activated."
        end

        # return the message
        message
    end

    # delete a project via the Basecamp API
    # 
    # @param [Basecampeverest::Project] project_id the project id of the basecamp project to change
    # @return [Basecampeverest::Project] a message detailing successfull or unsuccessful deletion
    def self.delete(project_id)
        # for some reason ruby won't put in the project ID for a delete method. Solved by setting the url
        # and then calling delete
        url = "/projects/#{project_id}.json"
        response = Basecampeverest::Connect.delete url

        # This checks the response code for validity and error checking
        if response.code == 204
            message = "Project successfully deleted"
        elsif response.code == 403
            message = "You do not have permission to delete this project"
        else 
            message = "Invalid project ID or authentication. The project was not deleted."
        end

        # return the message
        message
    end

# end module and class
end; end