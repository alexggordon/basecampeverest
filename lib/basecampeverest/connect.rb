module Basecampeverest
  class Connect
    # includes
    include HTTParty
    include JSON

    # INTRODUCTION
    # *******************************************************
    # 
    # This is a class based off the required format for httparty. When an instance of the class is called,
    # httparty created the connection using the specific variables base_uri, and headers.
    # 
    # Once an instance of this class has been created, you can then call on the gem using that stored authorization. 
    # 
    # 
    # 
    # 
    # EXAMPLE
    # *******************************************************
    # @authorization = { :username => "first.last@example.com", :password => "IuseSecureP@assw0rd$_" }
    # @user_agent = "PutAnythingHere (first.last@example.com)"
    # @basecamp_ID = "123456"
    # Basecampeverest::Connect.new(@basecamp_ID, @authorization, @user_agent)
    
    # => #<Basecampeverest::Connect:0x007fc8652eca18>
    
    # Basecampeverest::Project.all
    
    # =>[{"id"=>494832908, "name"=>"Cool Basecamp Project", "description"=>"this is a description", "archived"=>false, "is_client_project"=>false, 
    # "created_at"=>"2013-11-06T13:53:17.000-05:00", "updated_at"=>"2013-12-05T13:34:20.000-05:00", "draft"=>false,
    # "last_event_at"=>"2013-12-05T13:34:20.000-05:00", "starred"=>false,
    # "url"=>"https://basecamp.com/123456/api/v1/projects/494832908-Cool-Basecamp-Project.json"}]
    # 
    # 
    # 
    # 
    # LICENSE
    # *******************************************************
    # 
    # Copyright (c) 2014 Alex Gordon
    # Permission is hereby granted, free of charge, to any person obtaining
    # a copy of this software and associated documentation files (the
    # "Software"), to deal in the Software without restriction, including
    # without limitation the rights to use, copy, modify, merge, publish,
    # distribute, sublicense, and/or sell copies of the Software, and to
    # permit persons to whom the Software is furnished to do so, subject to
    # the following conditions:
    #   
    # The above copyright notice and this permission notice shall be
    # included in all copies or substantial portions of the Software.
    #       
    # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    # EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    # MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    # NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
    # LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
    # OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
    # WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    # 


    # Set a few variables
    attr_accessor :basecamp_id, :authorization, :user_agent, :base_uri, :headers

    # Initializes the connection to Basecamp using httparty. 
    #
    # @param basecamp_id [String] the Basecamp company ID
    # @param authorization [Hash] authorization hash consisting of a username and password combination (:username, :password) or an access_token (:access_token)
    # @param user_agent [String] the user-agent string to include in header of requests
    def initialize(basecamp_id, authorization, user_agent)
      # Set some variables
      self.class.base_uri "https://basecamp.com/#{basecamp_id}/api/v1"
      self.class.headers 'User-Agent' => user_agent
      self.auth = authorization

      # end method
    end
    
    # Sets the authorization information. 
    # Need to 
    # 
    # @param authorization [Hash] authorization hash consisting of a username and password combination (:username, :password) or an access_token (:access_token)
    def auth=(authorization)
      clensed_auth_hash = {}
      authorization.each {|k, v| 
        clensed_auth_hash[k.to_sym] = v
        }

      # nice and pretty now
      authorization = clensed_auth_hash
      
      # if the authorization has the correct hash values...
      if authorization.has_key?(:username) && authorization.has_key?(:password)

        # ... then we pass it off to basic auth
        self.class.basic_auth authorization[:username], authorization[:password]
        
        # check if the user tried passing in some other stupid stuff.
        # this should never be the case if the user follows instructions. 
        self.class.headers.reject!{ |k, v| k == "Authorization" }

      else
        # something inportant is missing if we get here. 
        raise "Incomplete Authorization hash. Please check the Authentication Hash."

        #end else 
      end

    # end method
    end

  # end class
  end

# end module
end