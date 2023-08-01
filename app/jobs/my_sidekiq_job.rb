class MySidekiqJob
  include Sidekiq::Worker
    
  def perform(user_id)
    email = User.find_by(id: user_id)&.email
    Rails.logger.info "MyBackgroundJob started at #{Time.now}"
    OrderMailer.mysidekiq(email).deliver_now
  end
end