class VoteMailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    VoteMailer.vote_notify('henry@gmail.com').deliver
  end
end
