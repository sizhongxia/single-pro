package com.single.pro.storage;

import java.io.File;

public interface FileStorage {

	boolean upload(String path, File file);

	boolean upload(String path, byte[] bytes);

}
