class ApplicationController < ActionController::API

  def serialize_error(error)
    error = error.message
    render json: ErrorSerializer.format_error(error), status: 400
  end


  def validate_ids 
    Customer.find(params[:customer_id]) if params[:customer_id]
    Tea.find(params[:tea_id]) if params[:tea_id]
  end
end
