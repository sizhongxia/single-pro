package com.single.pro.redis;

import redis.clients.jedis.ShardedJedis;

public interface RedisExecutor<T> {
	// redis执行接口
	T execute(ShardedJedis jedis);
}

