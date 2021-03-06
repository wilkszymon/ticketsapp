class Ticket < ApplicationRecord

    belongs_to :user, optional: true
    belongs_to :status

    validates :name,
                 presence: true, 
                 length: { in: 4..20 }

    validates :description,
                 presence: true, 
                 length: { in: 4..20 }

    validates :city,
                 presence: true, 
                 length: { in: 4..20 }

                 

    def self.search(search)
        if search
            where(["name LIKE ?", "%#{search}%"])
        else
            all
        end
    end

end
