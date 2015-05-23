namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    make_microposts
  end
end

def make_microposts
  50.times do
    User.all.each do |user|
      user.microposts.create!(:content => "some text")
    end
  end
end
