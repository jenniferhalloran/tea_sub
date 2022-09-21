module ErrorHelper 
  def serialize_error(error)
    error = error.message
    render json: ErrorSerializer.format_error(error), status: 400
  end
end