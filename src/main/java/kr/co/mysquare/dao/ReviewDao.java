package kr.co.mysquare.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.mysquare.dto.Comm;
import kr.co.mysquare.dto.RevGroup;
import kr.co.mysquare.dto.Review;

public interface ReviewDao 
{
	public void insertReview(Review review) throws ClassNotFoundException, SQLException;
	public List<RevGroup> getRevGroup() throws ClassNotFoundException, SQLException;
	public Review getReviewByRevCode(int revCode) throws ClassNotFoundException, SQLException;
	public List<Comm> getAllCommByRevCode(int revCode) throws ClassNotFoundException, SQLException;
	public void insertComm(Comm comm) throws ClassNotFoundException, SQLException;
	public void deleteComm(int commCode) throws ClassNotFoundException, SQLException;
	public int getLikeNum(int revCode) throws ClassNotFoundException, SQLException;
	public RevGroup getRevGroupName(int revGroupCode) throws ClassNotFoundException, SQLException;
	public List<Review> getMostPopularReview() throws ClassNotFoundException, SQLException;
	public void deleteComm1(String id) throws ClassNotFoundException, SQLException;
	public void reviewEdit(Review review) throws ClassNotFoundException, SQLException;
	public void deleteComm2(int revCode) throws ClassNotFoundException, SQLException;

}//end of ReviewDao interface