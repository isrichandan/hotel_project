class Room < ApplicationRecord
    validates :user_name, presence: true

    #has_one_attached :main_image

    has_one_attached :main_image do |attachable|
        attachable.variant :thumb, resize: "100x100"
        attachable.variant :medium, resize: "300x300", monochrome: true
        end


    validate :acceptable_image
def acceptable_image
    return unless main_image.attached?
    # validate image is more than 1 MB
    unless main_image.byte_size <= 1.megabyte
    errors.add(:main_image, "is too big")
end
    # accept only images
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(main_image.content_type)
    errors.add(:main_image, "must be a JPEG or PNG")
end
end

end
