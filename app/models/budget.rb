class Budget < ApplicationRecord
  belongs_to :trip

  validates :price, presence: true
  validates :trip, presence: true

  CATEGORIES = %w[food healthcare laundry housing transports activity equipment]

  COEFF = [
    [340, 300, 380, 360, 350, 400],
    [20, 20, 20, 10, 10, 20],
    [20, 20, 20, 20, 20, 20],
    [80, 100, 260, 240, 210, 240],
    [100, 120, 150, 180, 160, 40],
    [20, 20, 50, 50, 240, 20],
    [420, 420, 120, 140, 10, 260]
  ]

  def self.coeff(category, activities)
    activities_coeff = activities.map do |activity|
      activity_index = Activity::ACTIVITIES.index(activity.name)
      category_index = CATEGORIES.index(category)
      COEFF[category_index][activity_index]
    end
    activities_coeff.inject { |sum, el| sum + el }.to_f / activities_coeff.size
  end

  def self.coeffs(activities)
    CATEGORIES.map do |category|
      {
        category: category,
        coeff: coeff(category, activities)
      }
    end
  end

  def self.by_category(activities, budget)
    coeffs(activities).map do |category_coeff|
      {
        category: category_coeff[:category],
        price: budget.to_i * category_coeff[:coeff] / 1000
      }
    end
  end

  # def get_int_values
  #   [gets, gets].map { |s| s.chomp.to_i }
  # end

  # puts "Enter your budget..."
  # response = gets.chomp

  # response.to_i

  # case response.to_i
  # when 'add'
  #   puts "Which numbers would you like to add?"
  #   operator = :+

  # end

  # answer = get_int_values.inject(operator)
  # puts "The answer is... #{ answer }"
end
