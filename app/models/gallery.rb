class Gallery < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  has_many :images, dependent: :destroy

  def default_image
    images.first || images.build
  end

end
