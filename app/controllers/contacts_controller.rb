class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create 
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice: "Nachricht gesendet."
    else 
      redirect_to new_contact_path. notice:"Ein Fehler ist aufgetreten."
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:Name, :Email, :Kommentar)
    end
  end