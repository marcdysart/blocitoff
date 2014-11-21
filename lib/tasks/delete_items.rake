task delete_items: :environment do
  desc "Delete all todo items that are older than 7 days"
  Item.where("created_at <= ?", Time.now - 7.days).destroy_all
end
