namespace :db do
  desc 'Reset Counter Cache!'
  task :reset_counter => :environment do
    candidate.all.each do |candidate|
      Candidate.reset_counters(candidate.id, :vote_logs)
    end
  end
end