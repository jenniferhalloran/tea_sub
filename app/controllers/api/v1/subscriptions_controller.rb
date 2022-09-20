class Api::V1::SubscriptionsController < ApplicationController 
  def create 
    Subscription.create!(customer_id: params[:customer_id], tea_id: params[:tea_id], title: params[:subscription_type], price: params[:subscription_type], frequency: params[:subscription_type])

  end
end