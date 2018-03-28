class Photo < ApplicationRecord

  # has_attached_file :image
  has_attached_file :image,
                  styles: { thumb: ["64x64#", :jpg],
                            original: ['500x500>', :jpg] },
                  convert_options: { thumb: "-quality 75 -strip",
                                     original: "-quality 85 -strip" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end