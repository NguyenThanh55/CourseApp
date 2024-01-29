from paypalrestsdk import Payment


def create_payment():
    payment = Payment({
        "intent": "sale",
        "payer": {
            "payment_method": "paypal"
        },
        "transactions": [{
            "amount": {
                "total": "10.00",
                "currency": "USD"
            }
        }],
        "redirect_urls": {
            "return_url": "http://your-website.com/execute_payment/",
            "cancel_url": "http://your-website.com/cancel_payment/"
        }
    })

    if payment.create():
        # Payment created successfully
        print("Payment created successfully. ID:", payment.id)
        # Redirect the user to payment approval URL
        for link in payment.links:
            if link.method == "REDIRECT":
                redirect_url = link.href
                print("Redirect URL:", redirect_url)
                # Redirect the user to redirect_url
    else:
        # Payment creation failed
        print("Payment creation failed:", payment.error)