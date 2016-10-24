require 'pry'
class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :click_baity

  def click_baity
    if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Top /\d/")
       errors[:title] << "Add more clickbait!"
     end
  end
end
