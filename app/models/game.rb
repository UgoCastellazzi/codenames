class Game < ApplicationRecord
  belongs_to :player_one_id
  belongs_to :player_two_id
end
