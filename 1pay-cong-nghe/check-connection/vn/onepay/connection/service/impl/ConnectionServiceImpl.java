package vn.onepay.connection.service.impl;

import java.io.DataOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;

import org.apache.commons.collections.map.HashedMap;


import vn.onepay.connection.service.ConnectionService;
import vn.onepay.connection.service.util.CommonConstant;

public class ConnectionServiceImpl implements ConnectionService{
    @Override
    public void checkCardChareging(Map<Object, Object> tokenKey, String accessKey, String secretKey) throws Exception {
        String type = (String) tokenKey.get(CommonConstant.TYPE);
        Boolean isOK = (Boolean) tokenKey.get(CommonConstant.STATUS);
        Boolean isAlert = (Boolean) tokenKey.get(CommonConstant.ALERT);
        Map<String, String> lstCard = getListCardByType(type);
        Integer totalError = 0;
        // check
        for (Map.Entry<String, String> entry : lstCard.entrySet()) {
            int connetionStatus = cardChargingProcess(accessKey, type, entry.getKey(), entry.getValue(), secretKey);
            if (connetionStatus != HttpURLConnection.HTTP_OK) {
                if (connetionStatus == HttpURLConnection.HTTP_CLIENT_TIMEOUT) {
                    totalError += CommonConstant.BIG_ERROR;
                } else {
                    totalError += CommonConstant.SMALL_ERROR;
                }
            }
            Thread.sleep(CommonConstant.TIME_CHECK);
        }
        if (!isOK.equals(isError(totalError,20,lstCard.size()))) {
            isOK = isError(totalError,20,lstCard.size());
            isAlert = true;
        }
        tokenKey.put(CommonConstant.STATUS, isOK);
        tokenKey.put(CommonConstant.ALERT, isAlert);
    }
    
    private Map<String, String> getListCardByType(String type) {
        Map<String, String> result = new HashedMap();
        if (type.equals(CommonConstant.TYPE_VIETTEL)) {
            result.put("1221496833742", "22113621417");
            result.put("5668247477571", "64035036140");
            result.put("3747281942455", "73778238420");
            result.put("1328495311791", "31633323129");
        }
        return result;
    }

    private int cardChargingProcess(String access_key, String type, String pin, String serial, String secretKey) throws Exception {
        String url = "https://api.1pay.vn/card-charging/v2/topup";
        URL obj = new URL(url);
        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
        // add request header
        con.setRequestMethod("POST");
        con.setRequestProperty("User-Agent", CommonConstant.USER_AGENT);
        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
        String urlParameters = "access_key=%access_key%&pin=%pin%&serial=%serial%" + "&type=%type%&signature=%signature%";
        urlParameters = urlParameters.replaceFirst("%access_key%", access_key);
        urlParameters = urlParameters.replaceFirst("%type%", type);
        urlParameters = urlParameters.replaceFirst("%pin%", pin);
        urlParameters = urlParameters.replaceFirst("%serial%", serial);
        // String secretKey = "k8k2ge1ur8jga5x9ch72irlclek6rpqo";
        // secret_key cua san pham do 1Pay cung cap
        String signature = generateSignatureCardCharging(access_key, pin, serial, type, secretKey);
        // access_key va secretKey do 1pay cung cap
        urlParameters = urlParameters.replaceFirst("%signature%", signature);
        // Send post request
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(urlParameters);
        wr.flush();
        wr.close();
        int responseCode = con.getResponseCode();
        return responseCode;
    }

    private String generateSignatureCardCharging(String access_key, String pin, String serial, String type, String secret) {
        String urlParameters = "";
        String signature = "";
        if ((access_key != null) && (pin != null) && (serial != null) && (type != null) && (secret != null)) {
            urlParameters = "access_key=$access_key&pin=$pin&serial=$serial&type=$type";
            urlParameters = urlParameters.replaceFirst("%access_key%", access_key);
            urlParameters = urlParameters.replaceFirst("%pin%", pin);
            urlParameters = urlParameters.replaceFirst("%serial%", serial);
            urlParameters = urlParameters.replaceFirst("%type%", type);
            signature = hmacDigest(urlParameters, secret, "HmacSHA256");
        }
        return signature;
    }

    private static String hmacDigest(String msg, String keyString, String algo) {
        String digest = "";
        try {
            if (keyString != null && keyString.length() > 0) {
                SecretKeySpec key = new SecretKeySpec((keyString).getBytes("UTF-8"), algo);
                Mac mac = Mac.getInstance(algo);
                mac.init(key);
                byte[] bytes = mac.doFinal(msg.getBytes("ASCII"));
                StringBuffer hash = new StringBuffer();
                for (int i = 0; i < bytes.length; i++) {
                    String hex = Integer.toHexString(0xFF & bytes[i]);
                    if (hex.length() == 1) {
                        hash.append('0');
                    }
                    hash.append(hex);
                }
                digest = hash.toString();
            }
        } catch (UnsupportedEncodingException e) {
        } catch (InvalidKeyException e) {
        } catch (NoSuchAlgorithmException e) {
        }
        return digest;
    }
    
    private Boolean isError(int totalEror,float rate,int totalCard) {
        float maxError = rate*totalCard/100 * CommonConstant.BIG_ERROR;
        return ( maxError > totalEror);
    }

}
