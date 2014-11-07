package vn.onepay.web.tld;

public class MyCustomTagLib {
	public static String invisibleString(String content, int numOfCharacter, String replaceCharacter, boolean beginOrEnd) {
		if(numOfCharacter>=content.length())
			return content.replaceAll(".", replaceCharacter);
		if(beginOrEnd){
			int pos = numOfCharacter;
			return content.substring(0, pos).replaceAll(".", replaceCharacter) + content.substring(pos);
		}else{
			int pos = content.length() - numOfCharacter;
			return content.substring(0, pos) + content.substring(pos).replaceAll(".", replaceCharacter); 
		}
	}
}
