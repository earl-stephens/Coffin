class ApplicationMailer < ActionMailer::Base
  default from: 'admin@coffin.us-west-2.elasticbeanstalk.com.com'
  layout 'mailer'
end
