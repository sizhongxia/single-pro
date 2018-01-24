//package com.xlh;
//
//import java.io.ByteArrayInputStream;
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.io.ObjectInputStream;
//import java.io.ObjectOutputStream;
//import java.util.Date;
//
//import org.nustaq.serialization.FSTConfiguration;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//
//public class XlhBj {
//
//	public static void main(String[] args) {
//		User user = new User();
//		user.setUsername("夏风飞舞");
//		user.setPassword("123456");
//		user.setAge(20);
//		user.setBirthday(new Date());
//
//		// long s = System.currentTimeMillis();
//		// for (int i = 0; i < 10000000; i++) {
//		Object r = JSON.toJSON(user);
//		// }
//		// System.out.println(System.currentTimeMillis() - s);
//
//		System.out.println(r.toString().length());
//
//		User u = JSONObject.toJavaObject((JSON) r, User.class);
//		System.out.println(u.getUsername());
//
//		// FSTConfiguration jsonConf = FSTConfiguration.createJsonConfiguration();//
//		// FSTConfiguration.createJsonNoRefConfiguration();//createJsonConfiguration();
//		// FSTJsonFieldNames fieldNames = FSTJsonFieldNames.DEFAULT;
//		// fieldNames = fieldNames.TYPE("c");
//		// fieldNames = fieldNames.OBJ("o");
//		// jsonConf.setJsonFieldNames(fieldNames);
//
//		// String json = jsonConf.asJsonString(user);
//		// System.out.println(json);
//
//		// s = System.currentTimeMillis();
//		// for (int i = 0; i < 10000000; i++) {
//		// jsonConf.asJsonString(user);
//		// }
//		// System.out.println(System.currentTimeMillis() - s);
//
//		FSTConfiguration conf = FSTConfiguration.createDefaultConfiguration();
//
//		long s = System.currentTimeMillis();
//		for (int i = 0; i < 1000000; i++) {
//			conf.asByteArray(user);
//		}
//		System.out.println(System.currentTimeMillis() - s);
//
//		byte[] fstBytes = conf.asByteArray(user);
//		System.out.println(fstBytes.length);
//
//		Object obj = conf.asObject(fstBytes);
//		System.out.println(((User) obj).getUsername());
//
//		byte[] jdkBytes = null;
//		ByteArrayOutputStream bos = null;
//		ObjectOutputStream os = null;
//		s = System.currentTimeMillis();
//		for (int i = 0; i < 1000000; i++) {
//			try {
//				bos = new ByteArrayOutputStream();
//				os = new ObjectOutputStream(bos);
//				os.writeObject(user);
//				os.flush();
//				jdkBytes = bos.toByteArray();
//			} catch (IOException ex) {
//				ex.printStackTrace();
//			} finally {
//				if (os != null) {
//					try {
//						os.close();
//					} catch (IOException e) {
//						e.printStackTrace();
//					}
//				}
//				if (bos != null) {
//					try {
//						bos.close();
//					} catch (IOException e) {
//						e.printStackTrace();
//					}
//				}
//			}
//		}
//		System.out.println(System.currentTimeMillis() - s);
//		if (jdkBytes != null) {
//			System.out.println(jdkBytes.length);
//		}
//
//		Object object = null;
//		ByteArrayInputStream bis = null;
//		ObjectInputStream ois = null;
//		try {
//			bis = new ByteArrayInputStream(jdkBytes);
//			ois = new ObjectInputStream(bis);
//			object = ois.readObject();
//		} catch (IOException ex) {
//			ex.printStackTrace();
//		} catch (ClassNotFoundException ex) {
//			ex.printStackTrace();
//		} finally {
//			if (ois != null) {
//				try {
//					ois.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//			if (bis != null) {
//				try {
//					bis.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//		System.out.println(((User) object).getUsername());
//
//	}
//
//}
