package com.single.pro.quartz.job;

import org.springframework.stereotype.Component;

import com.single.pro.quartz.RunJob;

@Component
public class BaseJob implements RunJob {

	@Override
	public void run() {
		System.out.println("Now Time: " + System.currentTimeMillis());
	}

}
