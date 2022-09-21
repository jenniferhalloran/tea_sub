class Api::V1::SubscriptionsController < ApplicationController 
  include ErrorHelper

  def create 
    begin
      subscription = Subscription.create!(customer_id: params[:customer_id], tea_id: params[:tea_id], title: params[:subscription_type], price: params[:subscription_type], frequency: params[:subscription_type])
      render json: SubscriptionSerializer.new(subscription), status: 201
    rescue ActiveRecord::RecordInvalid => e
      record_error(e)
    rescue ArgumentError => e
      argument_error(e)
    end
  end
end