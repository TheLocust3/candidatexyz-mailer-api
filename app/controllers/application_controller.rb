class ApplicationController < ActionController::API

    def render_success
        render :json => { 'status': 'ok' }
    end
end
