class StatusMailer < ApplicationMailer
  def new_status_email
    @status = params[:status]
    mail(to: 'darjiniravv19@gmail.com', subject: "Training-Status-Date(#{@status.date.strftime('%d/%m/%Y')})")
  end
end
