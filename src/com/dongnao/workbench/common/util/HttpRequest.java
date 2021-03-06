/** 
 * @Project     ServicePlatform 
 * @File        HttpRequest.java 
 * @Package     com.soshare.common.util 
 * @Version     V1.0 
 * @Date        2015骞�1鏈�鏃�涓婂崍9:27:32 
 * @Author      luoyang
 */
package com.dongnao.workbench.common.util;

/** 
 * @Description TODO 
 * @ClassName   HttpRequest 
 * @Date        2015骞�1鏈�鏃�涓婂崍9:27:33 
 * @Author      luoyang 
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class HttpRequest {
    
    private static Logger logger = Logger.getLogger(HttpRequest.class);
    
    /**
     * 鍚戞寚瀹歎RL鍙戦�GET鏂规硶鐨勮姹�
     * 
     * @param url
     *            鍙戦�璇锋眰鐨刄RL
     * @param param
     *            璇锋眰鍙傛暟锛岃姹傚弬鏁板簲璇ユ槸 name1=value1&name2=value2 鐨勫舰寮忋�
     * @return URL 鎵�唬琛ㄨ繙绋嬭祫婧愮殑鍝嶅簲缁撴灉
     */
    public static String sendGet(String url) {
        String result = "";
        BufferedReader in = null;
        try {
            //            String urlNameString = url + "?" + param;
            URL realUrl = new URL(url);
            // 鎵撳紑鍜孶RL涔嬮棿鐨勮繛鎺�
            URLConnection connection = realUrl.openConnection();
            // 璁剧疆閫氱敤鐨勮姹傚睘鎬�
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 寤虹珛瀹為檯鐨勮繛鎺�
            connection.connect();
            // 鑾峰彇鎵�湁鍝嶅簲澶村瓧娈�
            Map<String, List<String>> map = connection.getHeaderFields();
            // 閬嶅巻鎵�湁鐨勫搷搴斿ご瀛楁
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 瀹氫箟 BufferedReader杈撳叆娴佹潵璇诲彇URL鐨勫搷搴�
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        }
        catch (Exception e) {
            //            System.out.println("鍙戦�GET璇锋眰鍑虹幇寮傚父锛� + e);
            e.printStackTrace();
        }
        // 浣跨敤finally鍧楁潵鍏抽棴杈撳叆娴�
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
    
    public static Map<String, String> bdsendGet(String url) {
        String result = "";
        BufferedReader in = null;
        Map<String, String> retMap = new HashMap<String, String>();
        try {
            //            String urlNameString = url + "?" + param;
            URL realUrl = new URL(url);
            // 鎵撳紑鍜孶RL涔嬮棿鐨勮繛鎺�
            URLConnection connection = realUrl.openConnection();
            // 璁剧疆閫氱敤鐨勮姹傚睘鎬�
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 寤虹珛瀹為檯鐨勮繛鎺�
            connection.connect();
            // 鑾峰彇鎵�湁鍝嶅簲澶村瓧娈�
            // 閬嶅巻鎵�湁鐨勫搷搴斿ご瀛楁
            
            // 瀹氫箟 BufferedReader杈撳叆娴佹潵璇诲彇URL鐨勫搷搴�
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
            Map<String, List<String>> map = connection.getHeaderFields();
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            List<String> cookies1 = map.get("Set-Cookie");
            StringBuffer sb1 = new StringBuffer();
            for (String cookie : cookies1) {
                sb1.append(cookie).append(";");
            }
            retMap.put("P3P", map.get("P3P").get(0));
            retMap.put("tracecode", map.get("tracecode").get(0));
            retMap.put("result", result);
            retMap.put("cookie", sb1.toString());
        }
        catch (Exception e) {
            //            System.out.println("鍙戦�GET璇锋眰鍑虹幇寮傚父锛� + e);
            e.printStackTrace();
        }
        // 浣跨敤finally鍧楁潵鍏抽棴杈撳叆娴�
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return retMap;
    }
    
    public static List<String> sendGet1(String url) {
        String result = "";
        BufferedReader in = null;
        Map<String, List<String>> map = null;
        try {
            //            String urlNameString = url + "?" + param;
            URL realUrl = new URL(url);
            // 鎵撳紑鍜孶RL涔嬮棿鐨勮繛鎺�
            URLConnection connection = realUrl.openConnection();
            // 璁剧疆閫氱敤鐨勮姹傚睘鎬�
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 寤虹珛瀹為檯鐨勮繛鎺�
            connection.connect();
            // 鑾峰彇鎵�湁鍝嶅簲澶村瓧娈�
            map = connection.getHeaderFields();
            // 閬嶅巻鎵�湁鐨勫搷搴斿ご瀛楁
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 瀹氫箟 BufferedReader杈撳叆娴佹潵璇诲彇URL鐨勫搷搴�
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        }
        catch (Exception e) {
            //            System.out.println("鍙戦�GET璇锋眰鍑虹幇寮傚父锛� + e);
            e.printStackTrace();
        }
        // 浣跨敤finally鍧楁潵鍏抽棴杈撳叆娴�
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return map.get("Set-Cookie");
    }
    
    public static String sendGet2(String url, String cookies) {
        String result = "";
        BufferedReader in = null;
        Map<String, List<String>> map = null;
        try {
            //            String urlNameString = url + "?" + param;
            URL realUrl = new URL(url);
            // 鎵撳紑鍜孶RL涔嬮棿鐨勮繛鎺�
            URLConnection connection = realUrl.openConnection();
            // 璁剧疆閫氱敤鐨勮姹傚睘鎬�
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            connection.setRequestProperty("Cookie", cookies);
            // 寤虹珛瀹為檯鐨勮繛鎺�
            connection.connect();
            // 鑾峰彇鎵�湁鍝嶅簲澶村瓧娈�
            map = connection.getHeaderFields();
            // 閬嶅巻鎵�湁鐨勫搷搴斿ご瀛楁
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 瀹氫箟 BufferedReader杈撳叆娴佹潵璇诲彇URL鐨勫搷搴�
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        }
        catch (Exception e) {
            //            System.out.println("鍙戦�GET璇锋眰鍑虹幇寮傚父锛� + e);
            e.printStackTrace();
        }
        // 浣跨敤finally鍧楁潵鍏抽棴杈撳叆娴�
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
    
    public static String sendGet(String url, String cookie) {
        String result = "";
        BufferedReader in = null;
        System.out.println(cookie);
        try {
            //            String urlNameString = url + "?" + param;
            URL realUrl = new URL(url);
            // 鎵撳紑鍜孶RL涔嬮棿鐨勮繛鎺�
            URLConnection connection = realUrl.openConnection();
            // 璁剧疆閫氱敤鐨勮姹傚睘鎬�
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            connection.setRequestProperty("Cookie", cookie);
            // 寤虹珛瀹為檯鐨勮繛鎺�
            connection.connect();
            // 鑾峰彇鎵�湁鍝嶅簲澶村瓧娈�
            Map<String, List<String>> map = connection.getHeaderFields();
            // 閬嶅巻鎵�湁鐨勫搷搴斿ご瀛楁
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 瀹氫箟 BufferedReader杈撳叆娴佹潵璇诲彇URL鐨勫搷搴�
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        }
        catch (Exception e) {
            //            System.out.println("鍙戦�GET璇锋眰鍑虹幇寮傚父锛� + e);
            e.printStackTrace();
        }
        // 浣跨敤finally鍧楁潵鍏抽棴杈撳叆娴�
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
    
    /**
     * 鍚戞寚瀹�URL 鍙戦�POST鏂规硶鐨勮姹�
     * 
     * @param url
     *            鍙戦�璇锋眰鐨�URL
     * @param param
     *            璇锋眰鍙傛暟锛岃姹傚弬鏁板簲璇ユ槸 name1=value1&name2=value2 鐨勫舰寮忋�
     * @return 鎵�唬琛ㄨ繙绋嬭祫婧愮殑鍝嶅簲缁撴灉
     */
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 鎵撳紑鍜孶RL涔嬮棿鐨勮繛鎺�
            URLConnection conn = realUrl.openConnection();
            // 璁剧疆閫氱敤鐨勮姹傚睘鎬�
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            conn.setRequestProperty("Content-Type", "application/json;charset=utf-8");
            // 鍙戦�POST璇锋眰蹇呴』璁剧疆濡備笅涓よ
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 鑾峰彇URLConnection瀵硅薄瀵瑰簲鐨勮緭鍑烘祦
            out = new PrintWriter(conn.getOutputStream());
            // 鍙戦�璇锋眰鍙傛暟
            out.print(param);
            // flush杈撳嚭娴佺殑缂撳啿
            out.flush();
            // 瀹氫箟BufferedReader杈撳叆娴佹潵璇诲彇URL鐨勫搷搴�
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        }
        catch (Exception e) {
            //            System.out.println("鍙戦� POST 璇锋眰鍑虹幇寮傚父锛� + e);
            e.printStackTrace();
        }
        //浣跨敤finally鍧楁潵鍏抽棴杈撳嚭娴併�杈撳叆娴�
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            }
            catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }
    
    public static String bdsendPost(String url, String param, String cookies,
            String tracecode, String P3P) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 鎵撳紑鍜孶RL涔嬮棿鐨勮繛鎺�
            URLConnection conn = realUrl.openConnection();
            // 璁剧疆閫氱敤鐨勮姹傚睘鎬�
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            conn.setRequestProperty("Content-Type",
                    "application/x-www-form-urlencoded; charset=UTF-8");
            conn.setRequestProperty("Cookie", cookies);
            conn.setRequestProperty("tracecode", tracecode);
            conn.setRequestProperty("P3P", P3P);
            // 鍙戦�POST璇锋眰蹇呴』璁剧疆濡備笅涓よ
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 鑾峰彇URLConnection瀵硅薄瀵瑰簲鐨勮緭鍑烘祦
            out = new PrintWriter(conn.getOutputStream());
            // 鍙戦�璇锋眰鍙傛暟
            out.print(param);
            // flush杈撳嚭娴佺殑缂撳啿
            out.flush();
            // 瀹氫箟BufferedReader杈撳叆娴佹潵璇诲彇URL鐨勫搷搴�
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        }
        catch (Exception e) {
            //            System.out.println("鍙戦� POST 璇锋眰鍑虹幇寮傚父锛� + e);
            e.printStackTrace();
        }
        //浣跨敤finally鍧楁潵鍏抽棴杈撳嚭娴併�杈撳叆娴�
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            }
            catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }
    
    public static Map<String, String> sendPost1(String url, String param,
            String cookies) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        Map<String, String> retMap = new HashMap<String, String>();
        try {
            URL realUrl = new URL(url);
            // 鎵撳紑鍜孶RL涔嬮棿鐨勮繛鎺�
            URLConnection conn = realUrl.openConnection();
            // 璁剧疆閫氱敤鐨勮姹傚睘鎬�
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            conn.setRequestProperty("Content-Type",
                    "application/x-www-form-urlencoded; charset=UTF-8");
            
            StringBuffer sb = new StringBuffer();
            conn.setRequestProperty("Cookie", cookies);
            
            // 鍙戦�POST璇锋眰蹇呴』璁剧疆濡備笅涓よ
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 鑾峰彇URLConnection瀵硅薄瀵瑰簲鐨勮緭鍑烘祦
            out = new PrintWriter(conn.getOutputStream());
            // 鍙戦�璇锋眰鍙傛暟
            out.print(param);
            // flush杈撳嚭娴佺殑缂撳啿
            out.flush();
            // 瀹氫箟BufferedReader杈撳叆娴佹潵璇诲彇URL鐨勫搷搴�
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
            retMap.put("result", result);
            Map<String, List<String>> map = conn.getHeaderFields();
            // 閬嶅巻鎵�湁鐨勫搷搴斿ご瀛楁
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            List<String> cookies1 = map.get("Set-Cookie");
            StringBuffer sb1 = new StringBuffer();
            if (cookies1 != null) {
                for (String cookie : cookies1) {
                    sb1.append(cookie).append(";");
                }
            }
            retMap.put("cookie", sb1.toString());
        }
        catch (Exception e) {
            //            System.out.println("鍙戦� POST 璇锋眰鍑虹幇寮傚父锛� + e);
            e.printStackTrace();
        }
        //浣跨敤finally鍧楁潵鍏抽棴杈撳嚭娴併�杈撳叆娴�
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            }
            catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return retMap;
    }
    
    
    //    public static JSONObject sendPostToSDP(StringEntity reqEntity, String url)
    //            throws Exception {
    //        JSONObject rtnJson = null;
    //        try {
    //            CloseableHttpClient httpclient = HttpClients.createDefault();
    //            HttpPost httpPost = new HttpPost(url);
    //            
    //            //璁剧疆瓒呮椂鏃堕棿--60s
    //            RequestConfig requestConfig = RequestConfig.custom()
    //                    .setSocketTimeout(MDA.TIME_OUT)
    //                    .setConnectTimeout(MDA.TIME_OUT)
    //                    .build();
    //            httpPost.setConfig(requestConfig);
    //            
    //            reqEntity.setContentType("application/json");
    //            httpPost.setEntity(reqEntity);
    //            CloseableHttpResponse response = httpclient.execute(httpPost);
    //            HttpEntity entity = response.getEntity();
    //            rtnJson = JSONObject.fromObject(EntityUtils.toString(entity));
    //            httpclient.close();
    //        }
    //        catch (SocketTimeoutException e) {
    //            logger.info(reqEntity);
    //            logger.info(e.fillInStackTrace(), e);
    //            logger.info("璇锋眰SDP鎺ュ彛瓒呮椂锛岃姹傛椂闂磘ime=" + MDA.TIME_OUT + ":URL=" + url);
    //            throw e;
    //            
    //        }
    //        catch (UnsupportedCharsetException e) {
    //            logger.info(e.fillInStackTrace(), e);
    //            e.printStackTrace();
    //            throw e;
    //        }
    //        catch (ClientProtocolException e) {
    //            logger.info(e.fillInStackTrace(), e);
    //            e.printStackTrace();
    //            throw e;
    //        }
    //        catch (ParseException e) {
    //            logger.info(e.fillInStackTrace(), e);
    //            e.printStackTrace();
    //            throw e;
    //        }
    //        catch (IOException e) {
    //            logger.info(e.fillInStackTrace(), e);
    //            e.printStackTrace();
    //            throw e;
    //        }
    //        
    //        return rtnJson;
    //    }
    
}
