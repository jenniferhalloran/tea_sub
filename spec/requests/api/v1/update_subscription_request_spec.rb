require 'rails_helper'

RSpec.describe 'Create Subscription', type: :request do 
  let!(:customer) {Customer.create(first_name: "Jennifer", last_name: "Halloran", street: "7 Pleasant Ave", zip_code: "11706", state: "NY", city: "Bay Shore", email: "halloran@udel.edu")}
  
  let!(:tea) {Tea.create(title: "Earl Grey", description: "Quintessentially British, the perfect treat during Great British Bake Off.", temperature: 208, brew_time: "3-5 minutes")}

  let!(:subscription) {Subscription.create(title: 1, price: 1, frequency: 1, customer_id: customer.id, tea_id: tea.id)}

  let!(:headers) { {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  }}

  context 'happy path' do
    it 'deactivates a subscription' do
      params = {
         "active": false
      }

      patch "/api/v1/subscriptions/#{subscription.id}", headers: headers, params: JSON.generate(params)

      results = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response.status).to eq(200)
      expect(results).to be_a(Hash)
      expect(results[:type]).to eq('subscription')
      expect(results[:attributes]).to be_a Hash 
      expect(results[:attributes][:customer_id]).to eq(customer.id)
      expect(results[:attributes][:tea_id]).to eq(tea.id)
      expect(results[:attributes][:title]).to eq("Tier 2")
      expect(results[:attributes][:price]).to eq(9.99)
      expect(results[:attributes][:frequency]).to eq("bi-weekly")
      expect(results[:attributes][:active]).to eq(false)
    end 
    it 'deactivates a subscription' do
      params = {
         "subscription_type": 0
      }

      patch "/api/v1/subscriptions/#{subscription.id}", headers: headers, params: JSON.generate(params)

      results = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response.status).to eq(200)
      expect(results).to be_a(Hash)
      expect(results[:type]).to eq('subscription')
      expect(results[:attributes]).to be_a Hash 
      expect(results[:attributes][:customer_id]).to eq(customer.id)
      expect(results[:attributes][:tea_id]).to eq(tea.id)
      expect(results[:attributes][:title]).to eq("Tier 1")
      expect(results[:attributes][:price]).to eq(4.99)
      expect(results[:attributes][:frequency]).to eq("weekly")
      expect(results[:attributes][:active]).to eq(true)
    end 
  end
  context 'sad path' do
    # it 'returns an error if parameter is missing' do
    #   params = {
    #     "tea_id": tea.id,
    #     "subscription_type": 0
    #   }

    #   post '/api/v1/subscriptions', headers: headers, params: JSON.generate(params)

    #   results = JSON.parse(response.body, symbolize_names: true)[:data]
    #   expect(response.status).to eq(400)
    #   expect(results).to be_a(Hash)
    #   expect(results[:error]).to eq("Customer must exist and Customer can't be blank")
    # end 
  end
end