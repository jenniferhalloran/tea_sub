class Api::V1::SubscriptionsController < ApplicationController 
  include ErrorHelper
  before_action :subscription_type_update, only: [:update, :create]

  def create 
    begin
      sub = Subscription.create!(subscription_params)
      render json: SubscriptionSerializer.new(sub), status: 201
    rescue ActiveRecord::RecordInvalid => e
      record_error(e)
    rescue ArgumentError => e
      argument_error(e)
    end
  end

  def update 
    sub = Subscription.find(params[:id])
    sub.update(subscription_params)
    render json: SubscriptionSerializer.new(sub), status: 200
  end


  private 
  def subscription_params
    params.permit(:title, :customer_id, :tea_id, :price, :frequency, :active)
  end

  def subscription_type_update 
    if params[:subscription_type]
      params[:title] = params[:subscription_type]
      params[:frequency] = params[:subscription_type]
      params[:price] = params[:subscription_type]
    end
  end
end