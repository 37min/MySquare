package kr.co.mysquare.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import kr.co.mysquare.dto.*;

public interface AdminDao 
{
	public List<HLDistrict> getHLDistrict() throws ClassNotFoundException, SQLException;
	public List<MLDistrict> getMLDistrict(int hlLocNameParam) throws ClassNotFoundException, SQLException;
	public List<LLDistrict> getLLDistrict(int mlLocNameParam) throws ClassNotFoundException, SQLException;
	public List<Location> getLocations(int llLocNameParam) throws ClassNotFoundException, SQLException;
	public Location getLocation(String locName) throws ClassNotFoundException, SQLException;
	public int getLocationUpdate(Location location) throws ClassNotFoundException, SQLException;
	public int getLocationDelete(String locName) throws ClassNotFoundException, SQLException;
	public LLDistrict getLLLocCode(int llLocNameParam) throws ClassNotFoundException, SQLException;
	public LocGroup getLocGroup(String locName) throws ClassNotFoundException, SQLException;
	public void getLocationInsert(Location location) throws ClassNotFoundException, SQLException;
	public List<Member> getMemberById(Member mb) throws ClassNotFoundException, SQLException;
	public void delete1bookmark(String locName) throws ClassNotFoundException, SQLException;
	public void delete3REVRECOMM(int revCode) throws ClassNotFoundException, SQLException;
	public List<Review> Review(String locName) throws ClassNotFoundException, SQLException;
	
}//end of AdminDao interface