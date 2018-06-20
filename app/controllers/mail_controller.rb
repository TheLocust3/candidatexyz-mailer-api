class MailController < ApplicationController
    include CandidateXYZ::Concerns::Authenticatable
    before_action :authenticate, except: [ :mail_reset_password ]

    def mail_as_company
        parameters = mail_as_company_params(params)

        Mailer.send_as_company(parameters[:email], parameters[:subject], parameters[:body]).deliver_later

        render :json => { 'status': 'ok' }
    end

    def mail_reset_password
        body = "
            <p>Someone has requested a link to change your password. You can do this through the link below.</p>
    
            <p><a href='#{Rails.application.secrets.auth_api}/auth/password/edit?config=default&redirect_url=#{CGI.escape("#{Rails.application.secrets.website}/reset_password")}&reset_password_token=#{params[:token]}'>Change my password</a></p>
            
            <p>If you didn&#39;t request this, please ignore this email.</p>
            <p>Your password won&#39;t change until you access the link above and create a new one.</p>
        "
  
        Mailer.send_as_company(params[:email], 'Reset Password Request', body).deliver_later
    end

    def mail_as_campaign
        parameters = mail_as_campaign_params(params)

        Mailer.send_as_campaign(parameters[:email], parameters[:subject], parameters[:body]).deliver_later

        render :json => { 'status': 'ok' }
    end

    def mail_many_as_campaign
        params[:emails].map {|email|
            puts 'testestestestestest'
            Mailer.send_as_campaign(email, params[:subject], params[:body]).deliver_later
        }

        render :json => { 'status': 'ok' }
    end

    private
    def mail_as_company_params(params)
        params.permit(:email, :subject, :body)
    end

    def mail_as_campaign_params(params)
        params.permit(:email, :subject, :body)
    end
end
