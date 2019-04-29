package dto;

public class MovieNaverDto {
	private String lastBuildDate; //검색결과를 생성한 시간
	private String items; //title, link, image, subtitle, pubDate, director, actor, userRating을 포함한다.
	private String title; //검색 결과 영화 제목
	private String link; //검색 결과 영화의 하이퍼텍스트 link를 나타낸다.
	private String image; //이미지 URL
	private String subtitle; //영문제목
	private String pubDate; //제작 년도
	private String director; // 감독
	private String actor; //출연배우
	private String userRating; //유저 평점
	
	public MovieNaverDto() {};
	
	public MovieNaverDto(String lastBuildDate, String items, String title, String link, String image, String subtitle,
			String pubDate, String director, String actor, String userRating) {
		super();
		this.lastBuildDate = lastBuildDate;
		this.items = items;
		this.title = title;
		this.link = link;
		this.image = image;
		this.subtitle = subtitle;
		this.pubDate = pubDate;
		this.director = director;
		this.actor = actor;
		this.userRating = userRating;
	}
	
	 

	@Override
	public String toString() {
		return "movieNaver [lastBuildDate=" + lastBuildDate + ", items=" + items + ", title=" + title + ", link=" + link
				+ ", image=" + image + ", subtitle=" + subtitle + ", pubDate=" + pubDate + ", director=" + director
				+ ", actor=" + actor + ", userRating=" + userRating + "]";
	}



	public String getLastBuildDate() {
		return lastBuildDate;
	}

	public void setLastBuildDate(String lastBuildDate) {
		this.lastBuildDate = lastBuildDate;
	}

	public String getItems() {
		return items;
	}

	public void setItems(String items) {
		this.items = items;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getUserRating() {
		return userRating;
	}

	public void setUserRating(String userRating) {
		this.userRating = userRating;
	}
	
	
	
}
