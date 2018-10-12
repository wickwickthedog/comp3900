package com.h2cg.accommodation.utils;

import java.io.File;
import java.util.ArrayList;

public class PhotoUtil {
	
	public static ArrayList<String> getPhotoPath(String directory,String photoDir) {
		File f1 = new File(directory);
		ArrayList<String> dirList = new ArrayList<String>();
		if (f1.isDirectory()) {
			String s[] = f1.list();
			for (int i = 0; i < s.length; i++) {
				File f = new File(directory + "/" + s[i]);
				if (f.isFile()) {
					dirList.add(photoDir+s[i]);
				}
			}
		}
		return dirList;
	}
}