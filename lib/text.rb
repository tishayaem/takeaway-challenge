#require 'twilio-ruby'
class Text
def self_setup
	Twilio.configure do |config|

# put your own credentials here
config.account_sid = 'AC0b797088e6fc39f458eab5239fc507ef'
config.auth_token = 'f6e744ac8be604a3b961099b35f06671'
end
end

def initialize
	Twilio.setup
# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token
end

def send time
@client.account.messages.create({
	:from => '+441325952441',
	:to =>   '+447968341641',
	:body => "test",
})
end
end
