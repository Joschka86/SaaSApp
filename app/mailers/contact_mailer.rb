class ContactMailer < ActionMailer::Base
    default to: 'joschka23@web.de'
    def contact_email(name, email, body)
      @name = name
      @email = email
      @body = body
      mail(from: email, subjetct: 'Contact Form Mesage')
    end
  end