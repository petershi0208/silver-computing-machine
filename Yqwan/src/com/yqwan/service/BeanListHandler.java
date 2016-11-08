package com.yqwan.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;

import com.yqwan.domain.Game;

public class BeanListHandler extends DefaultHandler{
//将读取的内容存放到一个book对象中，存放到list集合中	
	ArrayList<Game> list = new ArrayList<Game>();
	private String currentTag;
	private Game game;
	
	@Override
	public void startElement(String uri, String localName, String qName,Attributes attributes) throws SAXException {
		currentTag = qName;
		if("game".equals(currentTag)) {
			game = new Game();
		}
	}

	@Override
	public void characters(char[] ch, int start, int length)
			throws SAXException {
		if("gamename".equals(currentTag)) {
			String gamename = new String(ch,start,length);
			game.setGamename(gamename);
		}
		if("login_path".equals(currentTag)) {
			String login_path = new String(ch,start,length);
			game.setLoginpath(login_path);
		}
		if("pay_path".equals(currentTag)) {
			String path_path = new String(ch,start,length);
			game.setPaypath(path_path);
		}
		if("check_path".equals(currentTag)) {
			String check_path = new String(ch,start,length);
			game.setCheckpath(check_path);
		}
		if("key".equals(currentTag)) {
			String key = new String(ch,start,length);
			game.setKey(key);
		}
	}

	@Override
	public void endElement(String uri, String localName, String qName)
			throws SAXException {
		if("game".equals(qName)) {
			list.add(game);
			game = null;
		}
		currentTag = null;
	}

	
	public ArrayList<Game> getGames() {
		return list;
	}
	 
	public static ArrayList XmlToList(String path) throws ParserConfigurationException,
			SAXException, IOException {
		// 创建解析工厂
		SAXParserFactory factory = SAXParserFactory.newInstance();
		// 创建解析器
		SAXParser parser = factory.newSAXParser();
		// 得到读取器
		XMLReader reader = parser.getXMLReader();
		// 设置内容处理器
		BeanListHandler handler = new BeanListHandler();
		reader.setContentHandler(handler);
		// 读取xml文档
		reader.parse(path);
		ArrayList list = handler.getGames();			//xml解析成java对象组成list集合
		return list;
	}
}
