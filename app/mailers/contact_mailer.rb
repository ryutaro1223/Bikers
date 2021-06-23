class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    name = @contact.name
    message = @contact.message
    mail to: 'k.ryutaro1223@gamil.com' , subject: 'お問い合わせ内容'
  end
end
