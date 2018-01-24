package com.single.pro.util;

import java.net.URL;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;

public class SendMailUtil {
	public static void main(String[] args) throws Exception {
		// Email email = new SimpleEmail();
		// email.setHostName("smtp.qq.com");
		// email.setSmtpPort(465);
		// email.setAuthenticator(new DefaultAuthenticator("1217491317@qq.com",
		// "wangting3067"));
		// email.setSSLOnConnect(true);
		// email.setFrom("1217491317@qq.com");
		// email.setSubject("TestMail");
		// email.setMsg("This is a test mail ... :-)");
		// email.addTo("1217491317@qq.com");
		// email.send();

		HtmlEmail email = new HtmlEmail();
		email.setHostName("smtp.qq.com");
		email.setSmtpPort(465);
		email.setAuthenticator(new DefaultAuthenticator("1217491317@qq.com", "wangting3067"));
		email.setSSLOnConnect(true);
		email.addTo("1217491317@qq.com");
		email.setFrom("1217491317@qq.com", "仲夏");
		email.setSubject("Test email with inline image");

		EmailAttachment attachment = new EmailAttachment();
		attachment.setURL(new URL("http://www.apache.org/images/asf_logo_wide.gif"));
		attachment.setDisposition(EmailAttachment.ATTACHMENT);
		attachment.setDescription("Apache logo");
		attachment.setName("Apache logo.gif");

		email.attach(attachment);
		// embed the image and get the content id
		URL url = new URL("http://www.apache.org/images/asf_logo_wide.gif");
		String cid = email.embed(url, "Apache logo");
		// set the html message
		email.setHtmlMsg("<html>The apache logo - <img src=\"cid:" + cid + "\"></html>");
		// set the alternative message
		email.setTextMsg("Your email client does not support HTML messages");

		System.out.println(email.send());
	}
}
