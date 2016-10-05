class UserMailer < ApplicationMailer
  default from: 'postmaster@app6fea400095244e5eb67de338ad2ada94.mailgun.org'

  def welcome_email(user)
    @user.email = kristenmkarcher@gmail.com
    @url  = 'https://shielded-woodland-96059.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def receive(email)
   page = Page.find_by(address: email.to.first)
   page.emails.create(
     subject: email.subject,
     body: email.body
   )

   if email.has_attachments?
     email.attachments.each do |attachment|
       page.attachments.create({
         file: attachment,
         description: email.subject
       })
     end
   end
 end
