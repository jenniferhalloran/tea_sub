require 'rails_helper'

RSpec.describe 'Create Subscription', type: :request do 
  let!(:customer) {Customer.create(first_name: "Jennifer", last_name: "Halloran", street: "7 Pleasant Ave", zip_code: "11706", state: "NY", city: "Bay Shore", email: "halloran@udel.edu")}
  
  let!(:tea) {Tea.create(title: "Earl Grey", description: "Quintessentially British, the perfect treat during Great British Bake Off.", temperature: 208, brew_time: "3-5 minutes")}

  let!(:headers) { {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  }}

  context 'happy path' do
    it 'creates a new tea subscription' do
      params = {
        "customer_id": customer.id,
        "tea_id": tea.id,
        "subscription_type": 0
      }

      post '/api/v1/subscriptions', headers: headers, params: JSON.generate(params)

      result = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(result).to be_a(Hash)
      expect(result[:type]).to eq('subscription')
    end 
  end
end