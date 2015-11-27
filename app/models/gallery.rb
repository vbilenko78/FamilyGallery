class Gallery < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  has_many :images

  def default_image
    images.first || images.build
  end

end
