class StatusMailer < ApplicationMailer
  def new_status_email
    @status = params[:status]
    mail(to: 'nishant@softcodingsolutions.com', subject: "Training-Status-Date(#{@status.date.strftime('%d/%m/%Y')})")
  end
end
