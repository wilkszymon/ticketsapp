class User < ApplicationRecord

    before_save {self.username = username.downcase}


    validates :username, 
                presence: true, 
                length: { in: 4..20 }, 
                uniqueness: { case_sensitive: false }


    has_secure_password
end

