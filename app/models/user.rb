require 'httparty'
require 'base64'

class User < ApplicationRecord
  after_create :save_image

  def auth0info
  	JSON.parse(self.userinfo)
  end

  def name
  	self.auth0info["info"]["name"]
  end

  def picture
  	self.auth0info["info"]["image"]
  end

  def save_image
  	img = HTTParty.get(self.picture).body
  	self.image = Base64.encode64(img)
  	self.save
  end

  def self.for_homepage
  	User.where("rank > 0").order("rank DESC")

    # [User.first, User.first, User.first, User.first, User.first]
  end
end
