class JobMailer < ApplicationMailer
    default from: 'toggl@example.com'

    def creation_email(job)
      @job = job
      mail(
        subject: 'タスク作成完了メール',
        to: 'user@example.com'
      )
    end  
end
