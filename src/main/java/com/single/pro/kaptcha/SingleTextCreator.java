package com.single.pro.kaptcha;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.text.impl.DefaultTextCreator;

public class SingleTextCreator extends DefaultTextCreator {
	/**
	 * @return the random text
	 */
	public String getText() {
		String text = super.getText();
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		session.setAttribute(Constants.KAPTCHA_SESSION_KEY, text);
		return text;
	}
}
