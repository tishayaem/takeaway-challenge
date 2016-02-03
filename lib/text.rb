require 'twilio-ruby'
class Text

  def delivery_time
    @time = Time.now + 60 * 60
  end

 def send
	 account_sid = 'AC0b797088e6fc39f458eab5239fc507ef'
	 auth_token = 'f6e744ac8be604a3b961099b35f06671'
	 @client = Twilio::REST::Client.new account_sid, auth_token
  @client.account.messages.create({
	:from => '+441325952441',
	:to => '+4407968341641',
	:body => "Your order will be delivered before #{delivery_time}"
})

end
end
