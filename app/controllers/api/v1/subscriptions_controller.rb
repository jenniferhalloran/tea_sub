class Api::V1::SubscriptionsController < ApplicationController 
  def create 
    begin
      subscription = Subscription.create!(customer_id: params[:customer_id], tea_id: params[:tea_id], title: params[:subscription_type], price: params[:subscription_type], frequency: params[:subscription_type])
      
      render json: SubscriptionSerializer.new(subscription), status: 201
    rescue ActiveRecord::RecordInvalid => invalid
      error = invalid.record.errors.full_messages.to_sentence.to_s
      render json: ErrorSerializer.format_error(error), status: 400
    end
  end
end