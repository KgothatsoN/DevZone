class ContactsController < ApplicationController
  def new
    #Instance variable connected to new contact form
    @contact = Contact.new
  end
  
  def create
    #Save contact form with details to @contact {name: 'john', email: 'email@email.com' etc}
    @contact = Contact.new(contact_params)
    if @contact.save
      #Save and retrieve contact form input then send them to contact mailer
      name = params[:contact][:name]
      email = params[:contact][:email]
      comments = params[:contact][:comments]
      ContactMailer.contact_email(name, email, comments).deliver
      flash[:success] = "Message Sent."
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  #Security method, strong parameters
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end