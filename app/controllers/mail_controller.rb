class UsersController < ApplicationController
    include Authenticatable
    before_action :authenticate

    def mail_as_company
        parameters = mail_as_company_params(params)

        Mailer.send_as_company(parameters[:email], parameters[:subject], parameters[:body]).deliver_later
    end

    def mail_as_campaign
        parameters = mail_as_campaign_params(params)

        Mailer.send_as_campaign(parameters[:email], parameters[:subject], parameters[:body]).deliver_later
    end

    def mail_many_as_campaign
        parameters = mail_many_as_campaign_params(params)

        parameters[:subjects].map {|subject|
            Mailer.send_as_campaign(parameters[:email], subject, parameters[:body]).deliver_later
        }
    end

    private
    def mail_as_company_params(params)
        params.permit(:email, :subject, :body)
    end

    def mail_as_campaign_params(params)
        params.permit(:email, :subject, :body)
    end

    def mail_many_as_campaign_params(params)
        params.permit(:email, :subjects, :body)
    end
end
