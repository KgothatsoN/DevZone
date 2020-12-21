class ContactMailer < ActiomMailer::Base
  default to: 'k-ntuli@hotmail.com'

  def contact_email(name, email, comments)
    @name = name
    @email = email
    @comments = comments
    
    mail(from: email, subject: 'Contact Form Message')
  end 

end