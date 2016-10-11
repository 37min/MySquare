package kr.co.mysquare.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class MyInterceptor extends HandlerInterceptorAdapter {
	 /**
	     * 생성자
	     */
	    public MyInterceptor() {
	        // default constructor
	    }
	    /**
	     * 로그인 세션체크 예외 주소 처리
	     */
	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//	        uecocity.bsp.common.exception.BSPException bs = new uecocity.bsp.common.exception.BSPException();
	        String requestURI = request.getRequestURI();
	        
	        if (requestURI.indexOf("/main.htm") > -1) { //세션체크 예외페이지
	            return true;
	        } else if (requestURI.indexOf("/memberLogin.htm") > -1) {
	            return true;
	        }else if (requestURI.indexOf("/locSearch.htm") > -1){
	            	return true;
	        }else if (requestURI.indexOf("/getLocById.htm") > -1){
	        	return true;
	        }else if (requestURI.indexOf("/memberJoin.htm") > -1){
	        	return true;
	        }else if( requestURI.indexOf("/getLocationsByLocGroupAndInputLocName.htm") > -1 )
	        {
	        	return true;
	        }
	        else {//위의 예외페이지 외에는 세션값을 체크해서 있으면 그냥 페이지표시
	         
	            HttpSession session = request.getSession();
	            String loginID = (String)session.getAttribute("id");
	            if (loginID != null && !loginID.isEmpty()) {
	                return true;
	            }
	        }
	        //정상적인 세션정보가 없으면 로그인페이지로 이동
	        response.sendRedirect(request.getContextPath() +"/memberLogin.htm");
	        //request.getRequestDispatcher(request.getContextPath() + "/memberLogin.htm").forward(request, response);
	        return false;
	    }
	}
