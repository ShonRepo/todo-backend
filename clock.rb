require 'clockwork'

require_relative './config/boot'
require_relative './config/environment'

module Clockwork
  every(1.day, 'RemoveExpiresTokenJob', at: '02:00', tz: 'UTC') { RemoveExpiresTokenJob.perform_now }
end
