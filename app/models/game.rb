class Game < ApplicationRecord
  belongs_to :player_one, class_name: "User", optional: true
  belongs_to :player_two, class_name: "User", optional: true
  serialize :words, Array
  has_many :clues
end
