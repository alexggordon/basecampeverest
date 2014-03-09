module Basecampeverest; class Convert

    # code originally written by Rebecca Miller-Webster
    # taken from https://gist.github.com/rmw/2710460

    # convert an array into a nested OpenStruct
    # 
    # @param [Basecampeverest::Project] object the recursive object to pass in
    # @return [Basecampeverest::Project] the found project information from the Basecamp API
    def to_ostruct_recursive(options)
      convert_to_ostruct_recursive(self, options) 
    end
    
    def convert_to_ostruct_recursive(obj, options)
      result = obj
      if result.is_a? Hash
        result = result.dup.with_sym_keys
        result.each  do |key, val| 
          result[key] = convert_to_ostruct_recursive(val, options) unless options[:exclude].try(:include?, key)
        end
        result = OpenStruct.new result       
      elsif result.is_a? Array
         result = result.map { |r| convert_to_ostruct_recursive(r, options) }
      end
      return result
    end
end; end