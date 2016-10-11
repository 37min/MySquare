package kr.co.mysquare.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.mysquare.dto.Location;
import kr.co.mysquare.dto.Review;

public interface LocationDao 
{
	public List<Location> getLocations() throws ClassNotFoundException, SQLException;
	public Location getLocById(String locName) throws ClassNotFoundException, SQLException;
	public List<Review> getReviewsByLocName(String locName) throws ClassNotFoundException, SQLException;
	
}//end of LocationDao interface