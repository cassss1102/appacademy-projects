require 'action_view'

class Cat < ApplicationRecord
   include ActionView::Helpers::DateHelper

  validates :name, :birth_date, :description, :color, :sex, presence: true
  validates :color, inclusion: {in: %w(black white orange grey brown),
    message: "Cannot input an invalid color" }
  validates :sex, inclusion: { in: %w(M F),
    message: "Male or female pls!"}

  has_many :cat_rental_requests, dependent: :destroy,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest

  def age
    # now = Date.today
    # year = now.year - self.birth_date.year
    # month  = now.mon - self.birth_date.mon
    # days = (now - self.birth_date).to_i
    #
    # if year > 0
    #   return 'OVER #{year} YEARS'
    # elsif month > 0
    #   return '#{month} months'
    # else
    #   return '#{days} days'
    # end
    time_ago_in_words(birth_date)
  end

end
