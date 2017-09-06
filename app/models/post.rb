class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  def clickbait?
    good_stuff = ["Won't Believe", "Secret", "Top
      [number]", "Guess"]
    if self.title
      unless good_stuff.any? { |title_element| self.title.include? title_element }
        errors.add(:title, "must be more clickbait-y!")
      end
    end
  end

end
