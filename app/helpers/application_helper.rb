module ApplicationHelper

    def gravatar_for(user, options = {size: 100})
        email_address = "siema@wp.pl"
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.username)
    end


    def logged_in?
        !!current_user 
    end
end
