class UserSubscriptionsSerializer
  include JSONAPI::Serializer
 
  attributes :first_name, :last_name, :email, :street, :zip_code, :state, :city, :subscriptions

  def subscriptions 
    object.subscriptions.collect do |sub|
      SubscriptionSerializer.new(sub)
    end
  end
end