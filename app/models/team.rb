class Team < ActiveRecord::Base
  self.table_name = 'teams'
  has_many :players
end
