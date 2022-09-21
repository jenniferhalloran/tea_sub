class Api::V1::UserSubscriptionsController < ApplicationController 

  def index 
    begin 
      customer = Customer.find(params[:id])
      render json: UserSubscriptionsSerializer.new(customer), status: 200
    rescue ActiveRecord::RecordNotFound => e  
      serialize_error(e)
    end
  end
end