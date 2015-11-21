# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "This task prunes old auctions that have ended"
task :prune_auctions => :environment do
  puts "Pruning auctions..."
  Auction.all.each do |auction|
    if auction.end > DateTime.now()
      puts "Removing #{auction.title}"
      auction.delete
    end
  end
  puts "done."
end

desc "This task updates the saved searches for each user"
task :update_searches => :environment do
  User.all.each do |user|
    puts "Updating saved searches for #{user.email}"
    gw_user = user.settings(:dashboard).gw_user
    gw_pass = user.settings(:dashboard).gw_pass
    user.settings(:dashboard).saved_searches.each do |search|
      puts "Updating #{search} search"
      account = Goodwill::Account.new(gw_user, gw_pass)
      auctions = account.search(search)
      auctions.each do |auction|
        old_auction = Auction.find_by(itemid: auction.itemid)
        if old_auction
          puts "Updating auction: #{auction.itemid} - #{auction.item}"
          old_auction.update_attributes(auction.to_hash)
          old_auction.touch
          old_auction.save
        else
          puts "New auction discovered: #{auction.itemid} - #{auction.item}"
          new_auction = user.auctions.create(auction.to_hash)
          new_auction.searchterm = search
          new_auction.save
        end
      end
    end
  end
  puts "done."
end

desc "This task updates the in progress auctions for each user"
task :update_in_progress => :environment do
  User.all.each do |user|
    puts "Updating in progress auctions for #{user.email}"
    gw_user = user.settings(:dashboard).gw_user
    gw_pass = user.settings(:dashboard).gw_pass
    account = Goodwill::Account.new(gw_user, gw_pass)
    auctions = account.in_progress
    auctions.each do |auction|
      old_auction = BiddingAuction.find_by(itemid: auction.itemid)
      if old_auction
        puts "Updating in progress auction: #{auction.itemid} - #{auction.item}"
        old_auction.update_attributes(auction.to_hash)
        old_auction.touch
        old_auction.save
      else
        puts "New in progress auction discovered: #{auction.itemid} - #{auction.item}"
        new_auction = user.bidding_auctions.create(auction.to_hash)
        new_auction.searchterm = search
        new_auction.save
      end
    end
  end
  puts "done."
end
