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
	public List<Location> getLocation(int llLocNameParam) throws ClassNotFoundException, SQLException;
}//end of AdminDao interface