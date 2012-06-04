require 'open-uri'
require 'ostruct'
require 'json'

class Github
  class << self
    def get_user_info(user)
      begin
        OpenStruct.new(JSON.parse(open("https://api.github.com/users/#{user}").read))
      rescue
        nil
      end
    end
  end
end
