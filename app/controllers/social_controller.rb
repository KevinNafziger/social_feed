require "HTTParty"
require 'json'


class SocialController < ApplicationController
  def index

  	@fb_is_hash = true
  	@tw_is_hash = true
    
    response = HTTParty.get('https://takehome.io/facebook' )
    begin
   	 @fbs = JSON.parse(response.body)
   	 	rescue JSON::ParserError => e
   	 		@fbs = response.to_s
   	 		@fb_is_hash = false
   	 end

   	 response = HTTParty.get('https://takehome.io/twitter' )
   	 begin
 		@twitters = JSON.parse(response.body)
   	 		rescue JSON::ParserError => e
   	 		@twitters = response.to_s
   	 		@tw_is_hash = false
	 end	    
 
  end

end