class SupportMailbox < ApplicationMailbox
  def process
    puts "START SupportMailbox#process:"
    #puts "From: #{mail.from}" - this works at displaying it, but not giving the value?
    #puts "From: #{mail.from_addrs}" - this works at displaying it, but not giving the value?
    #puts "From: #{mail.from_address}" #- this doesn't work?
    puts "From: #{mail.from}"
    puts "Subject: #{mail.subject}"
    puts "Body: #{mail.body}"
    puts "END SupportMailbox#process:"
    
    recent_order = Order.where(email: mail.from_addrs).order('created_at desc').first
    SupportRequest.create!(
      email: mail.from_addrs,
      subject: mail.subject,
      body: mail.body.to_s,
      order: recent_order
    )

    
  end
end
