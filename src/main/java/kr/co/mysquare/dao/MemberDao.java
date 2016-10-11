package kr.co.mysquare.dao;

import java.sql.SQLException;
import java.util.List;




import kr.co.mysquare.dto.Member;

public interface MemberDao 
{
	/*public void test() throws ClassNotFoundException, SQLException;*/
	/*이런식으로 쓰라는 샘플입니다 이거쓰지마세요*/
	
	
	public Member select(String id) throws ClassNotFoundException, SQLException ;
	
	public int insert(Member member) throws ClassNotFoundException, SQLException ;
	
	public int update(Member member) throws ClassNotFoundException, SQLException;
    
    public int delete(String id) throws ClassNotFoundException, SQLException;
}//end of MemberDao interface