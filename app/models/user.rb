class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :games_as_player_one, source: :games, foreign_key: :player_one
  has_many :games_as_player_two, source: :games, foreign_key: :player_two
end
