//package com.bytebuffer.api;
//
//import java.nio.ByteBuffer;
//
//public class ByteBufferTest {
//
//	public static void main(String[] args) {
//
//		ByteBuffer byteBuffer = ByteBuffer.allocate(3);
//		byteBuffer.put((byte) 1);
//		byteBuffer.put((byte) 2);
//		byteBuffer.put((byte) 3);
//
//		System.out.println(byteBuffer);
//		System.out.println(byteBuffer.get(1));
//		System.out.println(byteBuffer.get(0));
//		byteBuffer.position(2);
//		byteBuffer.limit(3);
//		System.out.println(byteBuffer.get());
//	}
//
//}
