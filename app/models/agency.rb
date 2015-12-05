class Agency < ActiveRecord::Base
  attr_accessible :email, :name,:country,:city,:sector,:network,:pics,:phone_nos,:website,:coordinator,:coordinator_email,:notes,:approved
  validates :name, :presence => true
  validates :email, :presence => true
end
