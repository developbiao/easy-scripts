#!/usr/bin/env python3
# -*- coding: utf8 -*-
# Description: send an email with attachments

import smtplib, email, ssl
import sys

from email import encoders
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from datetime import date, timedelta,datetime


def send_email():
    # here fill your want sujbect
    report_date = (datetime.now() - timedelta(1)).strftime('%Y-%m-%d')
    subject = f"Fruit market research {report_date}"

    # here fill your meail body 
    body = f"Dear developers, markket research {report_date} files is already，please read. (from robot message, do not reply.)"
    sender_email = "YOUR_EMAIL@gmail.com"
    # here fill your want send to users
    receivers_email = ["taylor-swift@gmail.com", "developer-lisa@gmail.com", "blue-print@gmail.com"]
    password = "YOUR_PASSWORD"

    # Create a multipart message and set headers
    message = MIMEMultipart()

    message["From"] = sender_email
    message["To"] = ", " . join(receivers_email)
    message["Subject"] = subject

    # Add body to email
    message.attach(MIMEText(body, "plain"))

    file_date = (datetime.now() - timedelta(1)).strftime('%Y%m%d')
    attachments = [f"Apple-{file_date}.xlsx", f"watermelon{file_date}.pdf"]

    # Here fill your document path
    document_path = "/YOUR_DOCUMENT_PATH/"

    # Open excel file in binary mode
    for filename in attachments:
        f = f"{document_path}{filename}"
        part = MIMEBase("application", "octet-stream")
        part.set_payload(open(f, "rb").read())
        encoders.encode_base64(part)
        part.add_header("Content-Disposition", f"attachment; filename= {filename}")
        message.attach(part)
    # Add attachment to message and convert message to string
    text = message.as_string()

    # Log in to server using secre context and send email
    context = ssl.create_default_context()
    with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as server:
        server.login(sender_email, password)
        server.sendmail(sender_email, receivers_email, text)

    print("Send Email finlished!\n")


# call send email
send_email()













