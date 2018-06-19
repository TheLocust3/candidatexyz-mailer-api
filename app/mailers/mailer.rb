class Mailer < ApplicationMailer

    def send_as_company(to, subject, body)
        @body = body
        mail(to: to, subject: subject, template_path: 'mail', template_name: 'company')
    end

    def send_as_campaign(to, subject, body)
        @body = body
        mail(to: to, subject: subject, template_path: 'mail', template_name: 'campaign')
    end
end
