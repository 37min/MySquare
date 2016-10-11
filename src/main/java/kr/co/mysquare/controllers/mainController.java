package kr.co.mysquare.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.mysquare.dao.LocationDao;
import kr.co.mysquare.dao.MemberDao;
import kr.co.mysquare.dao.ReviewDao;
import kr.co.mysquare.dto.Bookmark;
import kr.co.mysquare.dto.Following;
import kr.co.mysquare.dto.Location;
import kr.co.mysquare.dto.Review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController 
{
	@Autowired
	private SqlSession sqlSession;
	
	public void updateSideMenu(HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		String id = (String) session.getAttribute("id");
		if( id == null ) return;
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		LocationDao locationDao = sqlSession.getMapper(LocationDao.class);
		
		List<Following> followingList = memberDao.following(id);
		List<Bookmark> myBookmark = memberDao.getMyBookmark(id);
		
		List<Location> myFavoriteLocation = new ArrayList<Location>();
		
		for( Bookmark bk : myBookmark )
		{
			Location location = new Location();
			location = locationDao.getLocById( bk.getLocName() );
			myFavoriteLocation.add(location);
		}
		
		model.addAttribute("followingList", followingList);
		model.addAttribute("myFavoriteLocation", myFavoriteLocation);
	}
	
	@RequestMapping("main.htm")
	public String main(HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		LocationDao locationDao = sqlSession.getMapper(LocationDao.class);
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		
		List<Location> locNameList = locationDao.getMostPopularLocation();
		List<Review> revCodeList = reviewDao.getMostPopularReview();
		
		List<Location> mostPopularLocList = new ArrayList<Location>();
		List<Review> mostPopularRevList = new ArrayList<Review>();
		
		if( locNameList.size() != 0 && locNameList != null ) //
		{
			for( Location loc : locNameList )
			{
				Location tempLoc = new Location();
				tempLoc = locationDao.getLocById(loc.getLocName());
				mostPopularLocList.add(tempLoc);
			}
		}
		
		if( revCodeList.size() != 0 && revCodeList != null )
		{
			for(Review rev : revCodeList)
			{
				Review tempRev = new Review();
				tempRev = reviewDao.getReviewByRevCode(rev.getRevCode());
				mostPopularRevList.add(tempRev);
			}
		}
		
		
		model.addAttribute("mostPopularLocList", mostPopularLocList);
		model.addAttribute("mostPopularRevList", mostPopularRevList);
		
		updateSideMenu(session,model);
		
		return "main.main";
	}
}//end of mainController class