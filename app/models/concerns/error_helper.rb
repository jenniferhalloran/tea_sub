module ErrorHelper 
  def argument_error(error)
    render json: ErrorSerializer.format_error(error.message), status: 400
  end

  def record_error(error)
    error_message = error.record.errors.full_messages.to_sentence.to_s
    render json: ErrorSerializer.format_error(error_message), status: 400
  end

end