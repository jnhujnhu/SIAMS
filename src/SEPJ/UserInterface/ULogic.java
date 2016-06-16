package SEPJ.UserInterface;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SEPJ.CoreSystem.*;
import SEPJ.Helper.*;

public class ULogic {
	public int uid;
	public String E_mail;
	
	public CourseManageSystem cms ;
	public FileManageSystem fms;
	public MessageManageSystem mms ;
	public NewsManageSystem nms ;
	public ScheduleManageSystem sms ;
	
	public static void main(String[] args)
	{
		ULogic ulg = new ULogic(10000);
		ArrayList<File> fset = ulg.getFileListByKeys("s", "o");
		for(int i = 0 ; i < fset.size() ; i ++)
			System.out.println(fset.get(i).fileName);
		return ;
	}
	
	static boolean illegal(char c)
	{
		if( c >= 'A' && c <= 'Z') return false ;
		else if( c >= 'a' && c <= 'z' ) return false ;
		else if( c == '_') return false ;
		else if( c >= '0' && c <= '9' ) return false ;
		else return true ;
	}
	
	static public int login(String unm , String pwd)
	/* this function will return userID when success and return -1 when failed*/
	{
		for(int i = 0 ; i < pwd.length() ; i ++)
			if( illegal(pwd.charAt(i)) )
				return -2 ;
		
		ResultSet res ;
		DBHelper dbh = new DBHelper("select userID from Users where username = ? and passward = ?;");
		try {
			dbh.pst.setString(1, unm);
			dbh.pst.setString(2, pwd);
			res = dbh.pst.executeQuery();
			if(res.next())
				return res.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return -1;
	}
	
	public ULogic(int userID)
	{
		uid = userID ;
		cms = new CourseManageSystem() ;
		fms = new FileManageSystem(userID) ;
		mms = new MessageManageSystem() ;
		nms = new NewsManageSystem() ;
		sms = new ScheduleManageSystem() ;
	}
	
	public String upload(String filePath, double fileSize, String introduction) {
		File tmpFile = new File();
		tmpFile.fid = 0;
		int i = filePath.lastIndexOf('\\');
		int j = filePath.lastIndexOf('.');
		tmpFile.fileName = filePath.substring(i + 1 , j);
		tmpFile.extentionName = filePath.substring(j + 1);
		tmpFile.introduction = introduction ;
		tmpFile.time = "" ;
		tmpFile.uploadUid = uid ;
		tmpFile.fileSize = fileSize ;
		tmpFile.path = "";
		String target = fms.uploadFile(tmpFile);
		return target ;
	}
	
	public String download(int fid) {
		String target = fms.downloadFile(fid);
		return target ;
	}
	
	public ArrayList<File> getDefaultFileList() {
		File f = new File() ;
		f.fid = -1 ;
		ArrayList<File> list = fms.searchFile(f);
		return list ;
	}
	
	public ArrayList<File> getFileListByKeys(String fileName, String introduction) {
		File f = new File();
		f.fileName = fileName ;
		f.introduction = introduction ;
		f.fid = 0 ;
		ArrayList<File> list = fms.searchFile(f);
		return list ;
	}
	
	public ArrayList<Message> getDefaultMsgList() {
		ArrayList<Message> report = new ArrayList<Message> ();
		Message tmpMsg = new Message();
		tmpMsg.mid = -1;
		report = mms.findMessage(tmpMsg);
		return report;
	}
	
	public ArrayList<Message> getMsgListByKeys(String content, String userName) {
		ArrayList<Message> report = new ArrayList<Message> ();
		Message tmpMsg = new Message();
		tmpMsg.mid = 0;
		tmpMsg.time = "";
		tmpMsg.uploadUid = 0;
		tmpMsg.userName = userName;
		tmpMsg.content = content;
		tmpMsg.lostAndFound = false;
		
		report = mms.findMessage(tmpMsg);
		return report ;
	}
	
	public int sendMsg(String title, String msg, int uid) {//why need uid?
		Message tmpMsg = new Message();
		tmpMsg.mid = 0;
		tmpMsg.time = "haha";
		tmpMsg.title = title ;
		tmpMsg.uploadUid = uid;
		tmpMsg.userName = "";
		tmpMsg.content = msg;
		tmpMsg.lostAndFound = false;
		
		mms.addMessage(tmpMsg);
		return new Integer(uid) ;
	}
	
	/*
	
	public void set_uid(int new_uid){
		uid=new_uid;
	}
	public int get_uid(){
		return uid;
	}
	public void set_usersname(String new_name){
		usersname=new_name;
	}
	public String get_usersname(){
		return usersname;
	}
	public void set_passwords(String new_passwords){
		passwords=new_passwords;
	}
	public String get_passwords(){
		return passwords;
	}
	public void set_E_mail(String new_E_mail){
		E_mail=new_E_mail;
	}
	public String get_E_mail(){
		return E_mail;
	}
	public void set_FileSystemIndex(int new_FileSystemIndex){
		FileSystemIndex=new_FileSystemIndex;
	}
	public int get_FileSystemIndex(){
		return FileSystemIndex;
	}
	public void set_NewsSystemIndex(int new_NewsSystemIndex){
		NewsSystemIndex=new_NewsSystemIndex;
	}
	public int get_NewsSystemIndex(){
		return NewsSystemIndex;
	}
	public void set_ScheduleSystemIndex(int new_ScheduleSystemIndex){
		ScheduleSystemIndex=new_ScheduleSystemIndex;
	}
	public int get_ScheduleSystemIndex(){
		return ScheduleSystemIndex;
	}
	public void set_CourseSystemIndex(int new_CourseSystemIndex){
		CourseSystemIndex=new_CourseSystemIndex;
	}
	public int get_CourseSystemIndex(){
		return CourseSystemIndex;
	}
	public void set_MessageSystemIndex(int new_MessageSystemIndex){
		MessageSystemIndex=new_MessageSystemIndex;
	}
	public int get_MessageSystemIndex(){
		return MessageSystemIndex;
	}
	
	*/
	
}
