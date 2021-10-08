class Idea < ApplicationRecord
 has_many :thoughts
  has_many :thinkers, through: :thoughts, dependent: :destroy

  validates :quote, :likes, presence: true
  validates :quote, length: { maximum: 100 }
  validate :no_more_than_ten_thinkers

  def no_more_than_ten_thinkers
    if self.thinkers.count > 10
      errors.add(:thinker_max, "cannot be more than 100.")
    end
  end

  def increase_times_loved
    self.update(likes: likes + 1)
  end

  def self.random_idea
    thinkers_array = []
    Category.all.each do |category|
      if category.thinkers.present?
        thinkers_array << category.thinkers.sample
      end
    end

    Idea.new(quote: "Lucks up Bucko", likes: 0, :thinkers => thinkers_array)
  end
end
