require 'text'
require 'twilio-ruby'

describe Text do

let(:client) do
  Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
end

let(:k) { double :person, number: '+441234567891' }
let(:mobile) {double :person, number: '+449876543211', name: 'k'}

it 'sends a message' do
  Text.call(message: "Hello", from: k, to: mobile, via: client)
end

end
