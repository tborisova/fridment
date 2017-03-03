require 'net/https'
require 'open-uri'

class Issue < ActiveRecord::Base
  has_many   :comments
  belongs_to :milestone
end