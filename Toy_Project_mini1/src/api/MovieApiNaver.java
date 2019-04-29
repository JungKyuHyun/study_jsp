package api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dto.MovieApiDto;

public class MovieApiNaver {
	
	public List<MovieApiDto> getMovieList(String searchWord){
        String clientId = "HJt3cXxXLVZv7M9KTfny";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "OPPsUrzs_G";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(searchWord, "UTF-8");
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
            
            JsonParser jsonParser = new JsonParser();

//            JsonArray jsonArray = (JsonArray) jsonParser.parse(response.toString());         
//            for(int i=0; i<jsonArray.size(); i++) {
//            	JsonObject object = (JsonObject) jsonArray.get(i);
//            	System.out.println(object.get("title").getAsString());
//            }
          
          List<MovieApiDto> movieArr = new ArrayList<>();
          JsonObject jsonObj = (JsonObject) jsonParser.parse(response.toString());
          JsonArray memberArray = (JsonArray) jsonObj.get("items");
          for(int i=0; i<memberArray.size(); i++) {
        	MovieApiDto m = new MovieApiDto();
          	JsonObject object = (JsonObject) memberArray.get(i);
          	m.setTitle(object.get("title").getAsString());
          	m.setLink(object.get("link").getAsString());
          	m.setImage(object.get("image").getAsString());
          	m.setSubtitle(object.get("subtitle").getAsString());
          	m.setPubDate(object.get("pubDate").getAsString());
          	m.setDirector(object.get("director").getAsString());
          	m.setUserRating(object.get("userRating").getAsString());
          	movieArr.add(m);
          }
          return movieArr;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        
	}
}
