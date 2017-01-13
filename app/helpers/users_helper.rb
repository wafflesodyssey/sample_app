module UsersHelper

  # This defined action returns the Gravatar for the given user.
  def gravatar_for(user, options = {size: 80})  #arguments with no options is (user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size] #this gives an options hash in gravatar_for
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
