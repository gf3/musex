# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image_url  :string(255)
#  url        :string(255)
#  source     :string(255)
#  source_id  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Artist < ActiveRecord::Base

  #-----------------------------------------------------------------------------
  # Relationships
  #-----------------------------------------------------------------------------

  has_and_belongs_to_many :users

end
