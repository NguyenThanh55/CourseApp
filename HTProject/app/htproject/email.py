from django.core import mail


def send_email(subject, body, receiver):
    try:
        connection = mail.get_connection()
        email1 = mail.EmailMessage(
            subject,
            body,
            "jennythanh2001@gmail.com",
            [receiver],
            connection=connection
        )
        email1.content_subtype = 'html'
        email1.send()
        return True
    except ValueError:
        return False
