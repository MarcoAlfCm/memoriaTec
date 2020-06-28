package mx.uaq.uavig.util;

import java.security.MessageDigest;
import java.util.List;

public class CustomUtil {

	public static boolean listIsNotBlank(final List<?> objectsList) {
		if( objectsList != null && !(objectsList.isEmpty()) && objectsList.size() > 0 ) {
			return true;
		}
		return false;
	}
	
	  public static String convetirMD5(String text) {
	        try {
	            MessageDigest md = MessageDigest.getInstance("MD5");
	            byte[] array = md.digest(text.getBytes());
	            StringBuffer sb = new StringBuffer();
	            for (int i = 0; i < array.length; ++i) {
	                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
	            }
	            return sb.toString();
	        } catch (java.security.NoSuchAlgorithmException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
}