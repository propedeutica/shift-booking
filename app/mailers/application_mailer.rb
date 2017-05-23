########################################################################
#  Class Application Mailer
#
#  : Define Mailers for the application
#
########################################################################
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
