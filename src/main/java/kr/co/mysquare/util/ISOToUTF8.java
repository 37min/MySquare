package kr.co.mysquare.util;

import java.io.UnsupportedEncodingException;

public class ISOToUTF8 
{
	public static String isoToUtf(String tmp) 
	{
		String utf = "";

		try 
		{
			utf = new String(tmp.getBytes("ISO-8859-1"), "UTF-8");
		} 
		catch(UnsupportedEncodingException e) 
		{
			e.printStackTrace();
		}

		return utf;
	}
}// end of ISOToUTF8 class