require 'test_helper'
 
class MailerTest < ActionMailer::TestCase
  test 'should send as company' do
    mail = Mailer.send_as_company('test@gmail.com', 'Subject', 'A body')
 
    assert_emails 1 do
        mail.deliver_now
    end
 
    assert_equal ['test@gmail.com'], mail.to
    assert_equal 'Subject', mail.subject
    assert mail.body.to_s.include? 'A body'
  end

  test 'should send as campaign' do
    mail = Mailer.send_as_campaign('test@gmail.com', 'Subject', 'A body')
 
    assert_emails 1 do
        mail.deliver_now
    end
 
    assert_equal ['test@gmail.com'], mail.to
    assert_equal 'Subject', mail.subject
    assert mail.body.to_s.include? 'A body'
  end
end