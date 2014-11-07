package vn.onepay.sms;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;


public class SMSBrandName {
	private static MultiThreadedHttpConnectionManager connectionManager;
	private static HttpClient client;
	static {

		if (connectionManager == null) {
			connectionManager = new MultiThreadedHttpConnectionManager();
			HttpConnectionManagerParams params = new HttpConnectionManagerParams();
			params.setDefaultMaxConnectionsPerHost(100);
			params.setMaxTotalConnections(5000);
			params.setParameter(HttpConnectionManagerParams.SO_TIMEOUT, 10000);
			params.setParameter(HttpConnectionManagerParams.CONNECTION_TIMEOUT,
					10000);
			connectionManager.setParams(params);
		}
		if (client == null)
			client = new HttpClient(connectionManager);
	}
	String brand ="1pay";
	String apiUrl = "http://mbus.vn/core/send_sms";
	String apiKey = "387330a217d6068d5946bfe8c4322b9b";
	
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	public void setApiUrl(String apiUrl) {
		this.apiUrl = apiUrl;
	}
	/*
	 * SEND SMS
	 * Endpoint: http://mbus.vn/core/send_sms
	 * Params:
	 * 	brand: tên brand (MWORK CORP)
	 * 	receivers: số điện thoại người nhận, nếu là nhiều người nhận thì phân cách bởi dấu ","
	 * 	content: Nội dung sms
	 * 	apikey=387330a217d6068d5946bfe8c4322b9b
	 */
	
	public boolean sendSMSBrandName(String receivers,String content) {
		System.out.println("/*----SEND SMS BRAND BEGIN----*/");
		System.out.println("Receivers: " + receivers);
		System.out.println("Content: " + content);
		System.out.println("/*----SEND SMS BRAND END----*/");
		client.getParams().setParameter("http.protocol.content-charset", "UTF-8");
		PostMethod post = new PostMethod(apiUrl);
		BufferedReader br = null;
		try {
			post.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded; charset=UTF-8");
			List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
			nameValuePairs.add(new NameValuePair("brand", brand));
			nameValuePairs.add(new NameValuePair("receivers", receivers));
			nameValuePairs.add(new NameValuePair("content", content));
			nameValuePairs.add(new NameValuePair("apikey", apiKey));

			post.setRequestBody(nameValuePairs
					.toArray(new NameValuePair[nameValuePairs.size()]));
			
			int returnCode = client.executeMethod(post);
			if (returnCode == HttpStatus.SC_NOT_IMPLEMENTED) {
				System.err.println("The Post method is not implemented by this URI");
				// still consume the response body
				post.getResponseBodyAsString();
			} else {
				br = new BufferedReader(new InputStreamReader(post.getResponseBodyAsStream()));
				String readLine;
				while (((readLine = br.readLine()) != null)) {
					System.err.println(readLine);
				}
				return true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			post.releaseConnection();
			if(br != null) try { br.close(); } catch (Exception fe) {}
		}
		return false;
	}
}
