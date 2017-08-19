module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :handle_active_redord_unprocesable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :handle_active_redord_record_not_found

    def handle_active_redord_unprocesable_entity(exception)
      render json: build_json_error('422', 'validation failed', exception.message), status: :unprocessable_entity
    end

    def handle_active_redord_record_not_found(exception)
      render json: build_json_error('404', 'not found', exception.message), status: :not_found
    end
  end

  def build_json_error(status, title, details, source=nil)
    {
      "errors": [
        {
          "status": status,
          "source": source,
          "title":  title,
          "detail": details
        }
      ]
    }
  end
end
