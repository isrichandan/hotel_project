class Booking < ApplicationRecord
    validates :user_id, presence: true 
    validates :user_id, uniqueness: true

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
    
    after_initialize do
        puts "\n Calling after after_intialize callback \n"
    end
    
    after_find :method_after_init

    after_find :method_after_find, if: :check_the_condition?

    after_touch :method_after_touch

    after_save :notify_user

    after_create :notify_user

    private

    def notify_user
      #  BookingMailer.notify_booking_creation(self.id).deliver_now
    end    

    def method_after_init
        puts "\n Calling after_initialize callback  \n"
    end
    
    def method_after_find
        puts "\n Calling after_find callback \n"
    end

    def method_after_touch
        puts "\n Calling after_touch callback \n"
    end
    
    def check_the_condition?
        false
    end    
    
end
