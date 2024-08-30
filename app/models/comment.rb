class Comment < ApplicationRecord
  include Visible

  belongs_to :coffee_cup
end