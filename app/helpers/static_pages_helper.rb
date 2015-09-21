module StaticPagesHelper
	  # Returns a user's status feed.
  def feed_all
    all_id = "SELECT user_id FROM users
                     WHERE  true"
    Entry.where("user_id IN (#{all_id})", user_id: id)
  end
end
