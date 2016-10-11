package kr.co.mysquare.dao;

import java.sql.SQLException;
import java.util.List;


import kr.co.mysquare.dto.Bookmark;
import kr.co.mysquare.dto.Following;
import kr.co.mysquare.dto.Member;
import kr.co.mysquare.dto.Review;

public interface MemberDao 
{	
	public Member select(String id) throws ClassNotFoundException, SQLException ;
	
	public int insert(Member member) throws ClassNotFoundException, SQLException ;
	
	public int update(Member member) throws ClassNotFoundException, SQLException;
    
    public int delete1bookmark(String id) throws ClassNotFoundException, SQLException;
    
    public int delete2FOLLOWING(String id) throws ClassNotFoundException, SQLException;
    
    public int delete3REVRECOMM(String id) throws ClassNotFoundException, SQLException;
    
    public int delete4Review(int revCode) throws ClassNotFoundException, SQLException;
    
    public int delete5MEMBER(String id) throws ClassNotFoundException, SQLException;
    
    public void addBookmark(String locName, String id) throws ClassNotFoundException, SQLException;
    
    public void deleteBookmark(String locName, String id) throws ClassNotFoundException, SQLException;
    
    public List<Bookmark> getMyBookmark(String id) throws ClassNotFoundException, SQLException;
    
    public int isMyBookmark(String locName, String id) throws ClassNotFoundException, SQLException;
    
    public void likeReview(String id, int revCode) throws ClassNotFoundException, SQLException;
    
    public int isLikedReivew(String id, int revCode) throws ClassNotFoundException, SQLException;
    
    public void canclelikeReview(String id, int revCode) throws ClassNotFoundException, SQLException;

	public List<Following> following(String id) throws ClassNotFoundException, SQLException;
    
	public List<Review> Review(String id) throws ClassNotFoundException, SQLException;
	
	public void addFollowing(String followerId, String followingId) throws ClassNotFoundException, SQLException;
	
	public void unFollowing(String followerId, String followingId) throws ClassNotFoundException, SQLException;
	
	public int isFollowedId(String followerId, String followingId) throws ClassNotFoundException, SQLException;
	
}//end of MemberDao interface