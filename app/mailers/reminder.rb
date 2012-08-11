class Reminder < ActionMailer::Base
  default from: "reminder@jobruntraining.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder.fatigue.subject
  #
  def fatigue(user, event)
    @greeting = "Hi #{user.first_name}"

    @event = event

    mail to: user.email
  end

  handle_asynchronously :fatigue


end
