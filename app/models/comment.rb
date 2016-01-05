class Comment < ActiveRecord::Base
  belongs_to :article

  validates :article, :presence => true
  validates :article_id, :presence => true
  validates_length_of :body, maximum: 249
  validates :body, exclusion: { in: %w(Dusan)}


  #include TextValidation1

  def self.for_dashboard
    order('created_at DESC').limit(5).all
  end

  def word_count
    body.split.count
  end
  def self.total_word_count
    all.inject(0) {|total, a| total += a.word_count }
  end
end
