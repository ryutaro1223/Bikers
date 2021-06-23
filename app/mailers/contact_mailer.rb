class ContactMailer < ApplicationMailer
  def contact_mailer(contact)
    @contact = contact
    mail to: 'k.ryutaro1223@gamil.com' , subject: 'お問い合わせ内容'
  end
end
