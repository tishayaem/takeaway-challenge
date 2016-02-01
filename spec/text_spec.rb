require 'text'
#require 'twilio-ruby'

describe Text do

let(:client) do
  Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
end

let(:K) { double :person, number: '+441234567891' }
let(:mobile) {double :person, number: '+449876543211', name: 'K'}

it 'sends a message' do
  Texter.call(message: "Hello", from: K, to: mobile, via: client)
end

end
