module Api
  class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
    rescue_from ActionController::ParameterMissing, :with => :parameter_missing
    respond_to :json

    def initialize
      @messages = []
      @errors = []
      @info = 'default'
      @render_options = {}
      @render_extra_options = {}
    end

    def _json
      {
        info: @info,
        data: @data,
        messages: @messages,
        errors: @errors
      }
    end

    def error!(err, info = 'error')
      return unless err
      @errors.push(err)
      info! info
      status! :bad_request
    end

    def data_set!(key, value, info = 'success')
      return unless key
      @data = {} unless @data
      @data[key] = value
      info! info
    end

    def message!(value)
      @messages.push value
    end

    def info!(value)
      @info = value
    end

    def options_set!(key, value)
      return unless key
      @render_options[key] = value
    end

    def status!(value)
      options_set! :status, value
    end

    def render_j(&block)
      options_set! :json, _json
      render @render_options, @extra_options, &block
    end

    def not_authorized_nil_user!
      not_authorized!
    end

    def not_authorized!
      error! 'not authorized'
      status! :unauthorized
      render_j
    end

    def target_resource_or_404
      error!('resource not found') and status!(:not_found) unless target_resource
      target_resource
    end

    def record_not_found
      status! :not_found
      return render_j
    end

    def parameter_missing(pm_error)
      error! pm_error
      return render_j
    end
  end
end
