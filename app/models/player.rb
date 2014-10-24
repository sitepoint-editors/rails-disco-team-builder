class Player < ActiveRecord::Base
  self.table_name = 'players'
  belongs_to :team
end
