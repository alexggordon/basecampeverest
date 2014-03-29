module Basecampeverest; class Topics
    # Topics are anything in basecamp that has a comment. In otherwords, if there are no comments on a project then this will return nothing. 

    # find all topics for all projects via the Basecamp API
    # 
    # @return [Basecampeverest::Project] all topics from the Basecamp API
    def self.all
        url = "/topics.json"
        response = Basecampeverest::Connect.get url

        # parse the response to remove HTTParty info
        response.parsed_response
    end

    # get all project topics via the Basecamp API
    # 
    # @param [Basecampeverest::Project] project_id the project id of the basecamp project to get the comment for 
    # @return [Basecampeverest::Project] the topic from the Basecamp API
    def self.find(project_id)
        url = "/projects/#{project_id}/topics.json"
        response = Basecampeverest::Connect.get url

        # parse the response to remove HTTParty info
        response.parsed_response
    end
end; end