package SEPJ.CoreSystem;
import java.util.ArrayList;
import java.util.Date;

import SEPJ.Helper.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class MessageManageSystem {
	ArrayList<Message> msgList;
	String sql = null;
	DBHelper db1 = null;
	ResultSet ret = null;
	
	public MessageManageSystem(){};
	
	String getUsernameByID(int uid)
	{
		DBHelper dbh = new DBHelper("select username from Users where userID = ?;");
		try {
			dbh.pst.setInt(1,uid);
			ResultSet res = dbh.pst.executeQuery();
			while(res.next()) {
				return res.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null ;
	}
	
	int getTotalNumber()
	{
		DBHelper dbh = new DBHelper("select COUNT(*) from MessageSet;");
		try {
			ResultSet res = dbh.pst.executeQuery();
			while(res.next()){
				return Integer.parseInt(res.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public int addMessage(Message msg) {
		/*sql = "insert into MessageSet(msgID, msgTitle, msgTime, uploadUser, uploadUid, msgContent, Lost_and_Found) values(" + 
				msg.mid + ", \'" + msg.title + "\', \'" + msg.time + "\', " 
				+ msg.uploadUid + ", \'" + msg.userName + "\', \'" + msg.content + "\'," 
				+ msg.lostAndFound + ")";
		*/
		sql = "insert into MessageSet(msgID, msgTitle, msgTime, uploadUser, uploadUid, msgContent, Lost_and_Found) values(?,?,?,?,?,?,?);";
		db1 = new DBHelper(sql);
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date d = new Date();
			msg.userName = getUsernameByID(msg.uploadUid);
			msg.time = df.format(d);
			msg.mid = getTotalNumber() + 1;
			db1.pst.setInt(1, msg.mid);
			db1.pst.setString(2, msg.title );
			db1.pst.setString(3, msg.time);
			db1.pst.setString(4, msg.userName);
			db1.pst.setInt(5, msg.uploadUid);
			db1.pst.setString(6, msg.content);
			db1.pst.setBoolean(7, msg.lostAndFound);
			db1.pst.executeUpdate();
			db1.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public ArrayList<Message> findMessage(Message msg) {
		ArrayList<Message> report = new ArrayList<Message> ();
		if (msg.mid != -1)
			sql = "select * from MessageSet where " + "msgContent LIKE " + "\'%" + msg.content+"%\'";
		else
			sql = "select * from MessageSet;";
		db1 = new DBHelper(sql);
		try {
			ret = db1.pst.executeQuery();
			while (ret.next()) {
				Message tmpMsg = new Message();
				tmpMsg.mid = Integer.parseInt(ret.getString(1));
				tmpMsg.title = ret.getString(2);
				tmpMsg.time = ret.getString(3);
				tmpMsg.uploadUid = Integer.parseInt(ret.getString(5));
				tmpMsg.userName = ret.getString(4);
				tmpMsg.content = ret.getString(6);
				tmpMsg.lostAndFound = Boolean.getBoolean(ret.getString(7));
				report.add(tmpMsg);
			}
			ret.close();
			db1.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		/* ... */
		return report;
	}
	public void deleteMessage(int mid){}
	public void accuseMessage(int mid){}
}
