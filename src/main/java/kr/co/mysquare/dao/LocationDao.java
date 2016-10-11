package kr.co.mysquare.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.mysquare.dto.LocGroup;
import kr.co.mysquare.dto.Location;
import kr.co.mysquare.dto.Review;

public interface LocationDao 
{
	public List<Location> getLocations() throws ClassNotFoundException, SQLException;
	public List<Location> getLocationsByInputLocName(Location location) throws ClassNotFoundException, SQLException;
	public Location getLocById(String locName) throws ClassNotFoundException, SQLException;
	public List<Review> getReviewsByLocName(String locName) throws ClassNotFoundException, SQLException;
	public List<LocGroup> getLocGroup() throws ClassNotFoundException, SQLException;
	public int getFavoriteNum(String locName) throws ClassNotFoundException, SQLException;
	public LocGroup getLocGroupName(int locGroupCode) throws ClassNotFoundException, SQLException;
	public List<Location> getMostPopularLocation() throws ClassNotFoundException, SQLException;
	public List<Location> getLocationsByLocGroupAndInputLocName(Location location) throws ClassNotFoundException, SQLException;
	
	
}//end of LocationDao interface