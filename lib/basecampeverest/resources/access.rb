module Basecampeverest; class Access

    # find the people that have access to a project via the Basecamp API
    # 
    # @param [Basecampeverest::Project] project_id the project id from basecamp
    # @return [Basecampeverest::Project] the parsed response of who has access from the Basecamp API
    def self.for_project(project_id)
        url = "/projects/#{project_id}/accesses.json"
        response = Basecampeverest::Connect.get url 

        # parse the response to remove HTTParty info
        response.parsed_response
    end

    # find the people that have access to a calendar via the Basecamp API
    # 
    # @param [Basecampeverest::Project] calendar_id the calendar id to check access
    # @return [Basecampeverest::Project] the parsed response of who has access from the Basecamp API
    def self.for_calendar(calendar_id)
        url = "/calendars/#{calendar_id}/accesses.json"
        response = Basecampeverest::Connect.get url 

        # parse the response to remove HTTParty info
        response.parsed_response
    end

    # find the people that have access to a project via the Basecamp API
    # 
    # @param [Basecampeverest::Project] project_id the project id from basecamp
    # @param [Basecampeverest::Project] options a hash containing the people to grant access
    # @return [Basecampeverest::Project] the parsed response of who has access from the Basecamp API
    def self.grant_project(project_id, options={})
        post_params = {
          :body => options.to_json,
          :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
        }
        url = "/projects/#{project_id}/accesses.json"
        response = Basecampeverest::Connect.post url, post_params

        # parse the response to remove HTTParty info
        response.parsed_response
    end

    # find the people that have access to a project via the Basecamp API
    # 
    # @param [Basecampeverest::Project] project_id the project id from basecamp
    # @param [Basecampeverest::Project] options a hash containing the people to revoke access for
    # @return [Basecampeverest::Project] the parsed response of who has access from the Basecamp API
    def self.revoke_project(project_id, user_id)
        post_params = {
          :body => options.to_json,
          :headers => Basecampeverest::Connect.headers.merge({'Content-Type' => 'application/json'})
        }
        url = "/projects/#{project_id}/accesses/#{user_id}.json"
        response = Basecampeverest::Connect.get url, post_params

        # parse the response to remove HTTParty info
        response.parsed_response
    end

# end module and class
end; end