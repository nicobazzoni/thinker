class Thought < ApplicationRecord
  belongs_to :thinker
  belongs_to :idea
end
