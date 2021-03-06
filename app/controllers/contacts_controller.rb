class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create 
    @contact = Contact.new(contact_params)
    if @contact.save
      name = params[:contact][:Name]
      email = params[:contact][:Email]
      body = params[:contact][:Kommentar]
      ContactMailer.contact_email(name, email, body).deliver
      flash[:success] = "Nachricht gesendet."
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
   end
  end

  private
    def contact_params
      params.require(:contact).permit(:Name, :Email, :Kommentar)
    end
  end