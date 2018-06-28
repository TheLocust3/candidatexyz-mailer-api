class UnsubscribeController < ApplicationController
    include CandidateXYZ::Concerns::Request

    def unsubscribe
        token = Rails.application.message_verifier(:unsubscribe).verify(params[:token])

        delete("#{Rails.application.secrets.volunteer_api}/#{token[:resource_type]}s/#{token[:resource_id]}", { campaign_id: token[:campaign_id] })

        
    end
end
