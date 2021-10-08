class Thinker < ApplicationRecord
  belongs_to :category
  has_many :thoughts 
  has_many :ideas, through: :thoughts, dependent: :destroy

  validates :name, :image,  :times_studied,  presence: true
  validates :name, length: { maximum: 35 }

  scope :sort_by_times_studied, -> { order(times_studied: :desc)}

  

  def category_name=(name)
    category = Category.find_by(name: name)
    self.category = category
  end

  def category_name
    category.name
  end

  def increase_times_studied
    update(times_studied: times_studied + 1)
  end

 

  def self.sort(filtered_thinkers, sort_params)
    case sort_params
      when "alphabetical" then filtered_thinkers.order(:name)
      when "times_studied" then filtered_thinkers.sort_by_times_studied
      
    end
  end
end
