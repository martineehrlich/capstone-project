class Art < ActiveRecord::Base
  validates :artist, :title, :image_file_name, presence: true
  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User
  has_many :categories, through: :categorizings, source: :category
  has_many :categorizings, as: :categorizable


  def self.arts_in_category(category_id)
    self.joins(:categorizings).where(categorizings: {category_id: category_id.to_i})
  end

  def self.arts_in_search(search_string)
    search_string = "%#{search_string}%"
    self.where("arts.title ilike ?", search_string)
    # self.where("arts.title ilike ? or arts.categories ilike ?", search_string, search_string)

    # arts.title ilike ? or arts.categories ilike ?
  end

  def full_image
    image_file_name.gsub(
      'image/upload',
      'image/upload/c_fill,h_400,w_600'
    )


  end

  def thumbnail_image
    image_file_name.gsub(
      'image/upload',
      'image/upload/c_fill,h_180,w_220'
    )

  end

  def search_image
    image_file_name.gsub(
      'image/upload',
      'image/upload/c_fill,h_30,w_30'
    )

  end

end
