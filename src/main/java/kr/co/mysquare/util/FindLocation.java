package kr.co.mysquare.util;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import java.net.*;
import org.xml.sax.*;

public class FindLocation 
{	
	public String[] toCoordinate(String locationSearch) //입력한 값(위치명)을 좌표로 전환해주는 함수
	{
		String[] result = new String[2];
		
		try 
		{
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			/*
			String str = 
					String.format("http://openapi.map.naver.com/api/geocode.php?key=f2bc417ef3f82e7227cfaf75d9561006&encoding=utf-8&coord=LatLng&query=%s", locationSearch);*/
			// localhost
			/*
			String str = 
					String.format("http://openapi.map.naver.com/api/geocode.php?key=b5dfe4a1c78f4bb89191450747d58e6b&encoding=utf-8&coord=LatLng&query=%s", locationSearch);
			*/
			String str = 
			String.format("http://openapi.map.naver.com/api/geocode.php?key=cd35cafc0e534805cbadaeec014e9f3a&encoding=utf-8&coord=LatLng&query=%s", locationSearch);
			//192.168.7.107
			
			URL url = new URL(str);
			InputSource is = new InputSource(url.openStream());
			
			Document xmlObj = builder.parse(is);
			Element root = xmlObj.getDocumentElement();
			
			// 이게 이제 노드 중에 X,Y노드를 찾아 그 값을 가져오는 과정
			// 주소가 같을시에는 첫번째 값만 가져온다.
			// 예를 들어 와동만 입력하면 안산시 와동도 있고 대전시 와동도 있는데 안산시 와동만 가져온다
			NodeList xNodes = root.getElementsByTagName("x");
			Element xNode = (Element)xNodes.item(0);
			result[0] = xNode.getTextContent();
			
			//System.out.println("findlocation 안 x(경도) : " + result[0] );
			
			NodeList yNodes = root.getElementsByTagName("y");
			Element yNode = (Element)yNodes.item(0);
			result[1] = yNode.getTextContent();
			
			//System.out.println("findlocation 안 y(위도) : " + result[1] );
						
		}
		catch(Exception e)
		{
			System.out.println("findLocation");
			System.out.println(e.toString());
		}
		return result;
	}
	
}//end of FindLocation class