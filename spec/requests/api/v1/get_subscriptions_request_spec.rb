RSpec.describe 'Create Subscription', type: :request do 
  let!(:customer1) {Customer.create(first_name: "Jennifer", last_name: "Halloran", street: "7 Pleasant Ave", zip_code: "11706", state: "NY", city: "Bay Shore", email: "halloran@udel.edu")}
  let!(:customer2) {Customer.create(first_name: "Squirrlington", last_name: "Acorns", street: "9 Maple Tree Lane", zip_code: "11706", state: "NY", city: "Bay Shore", email: "furball@squirrel.edu")}
  
  let!(:tea1) {Tea.create(title: "Earl Grey", description: "Quintessentially British, the perfect treat during Great British Bake Off.", temperature: 208, brew_time: "3-5 minutes")}
  let!(:tea2) {Tea.create(title: "Matcha", description: "High grade green tea ground into powder form. All the caffeine without the crash.", temperature: 175, brew_time: "None")}

  let!(:subscription1) {Subscription.create(title: 1, price: 1, frequency: 1, customer_id: customer1.id, tea_id: tea1.id, active: false)}
  let!(:subscription2) {Subscription.create(title: 0, price: 0, frequency: 0, customer_id: customer1.id, tea_id: tea2.id)}
  let!(:subscription3) {Subscription.create(title: 0, price: 0, frequency: 0, customer_id: customer2.id, tea_id: tea2.id)}

  let!(:headers) { {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  }}

  context 'happy path' do
    it 'gets all active and inactive subscriptions for a customer' do

    get "/api/v1/customers/#{customer1.id}/subscriptions", headers: headers

      results = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response.status).to eq(200)
      expect(results).to be_a(Hash)
      expect(results[:id]).to eq("#{customer1.id}")
      expect(results[:type]).to eq("user_subscriptions")
      expect(results[:attributes]).to have_key(:first_name)
      expect(results[:attributes]).to have_key(:last_name)
      expect(results[:attributes]).to have_key(:email)
      expect(results[:attributes]).to have_key(:street)
      expect(results[:attributes]).to have_key(:zip_code)
      expect(results[:attributes]).to have_key(:state)
      expect(results[:attributes]).to have_key(:city)
      expect(results[:attributes]).to have_key(:subscriptions)
      expect(results[:attributes][:subscriptions].count).to eq 2
    end
  end 
end