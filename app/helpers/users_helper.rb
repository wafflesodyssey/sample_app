module UsersHelper

  # This defined action returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexidigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
