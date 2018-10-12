package com.h2cg.accommodation.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	private static String DATE_TIME = "dd-MM-yyyy";
	
	private static SimpleDateFormat sdf;
	
	public static String getDateString(Date date){
		sdf = new SimpleDateFormat(DATE_TIME);
		return sdf.format(date);
	}
	
	public static Date DateString2Date(String dateStr) throws ParseException {

		sdf = new SimpleDateFormat(DATE_TIME);
		return sdf.parse(dateStr);
	}
//	public static String setDateTime()
}
