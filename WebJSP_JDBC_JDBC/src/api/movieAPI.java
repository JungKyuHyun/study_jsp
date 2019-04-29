package api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;



public class movieAPI {

    public static void main(String[] args) {
        String clientId = "HJt3cXxXLVZv7M9KTfny";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "OPPsUrzs_G";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode("식객", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/movie.json?query="+ text; // json 결과
       
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            
            JsonObject a = new  JsonObject();
            JsonParser jsonParser = new JsonParser();
            JsonObject jsonObj = (JsonObject) jsonParser.parse(response.toString());
            JsonArray memberArray = (JsonArray) jsonObj.get("items");
            for(int i=0; i<memberArray.size(); i++) {
            	JsonObject object = (JsonObject) memberArray.get(i);
//            	String title = object.get("title");
            	System.out.println(object.get("lastBuildDate"));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
