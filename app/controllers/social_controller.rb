require "HTTParty"
require 'json'


class SocialController < ApplicationController
  def index

  	@fb_as_json= true
	@tw_as_json = true
    @fbObj = []
    @twObj = []
    @fbStr =""
    @twStr= ""
	
    
    response = HTTParty.get('https://takehome.io/facebook' )
    begin
   	  @fbObj = JSON.parse(response.body)
   	    rescue JSON::ParserError => e
   	 	  @fbStr = response.to_s
   	 	  @fb_as_json = false
   	 end

   	 response = HTTParty.get('https://takehome.io/twitter' )
   	 begin
 	   @twObj = JSON.parse(response.body)
   	 	 rescue JSON::ParserError => e
   	 	   @twStr = response.to_s
   	 	   @tw_as_json = false
	 end	    
 
  end

end