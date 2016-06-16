package SEPJ.CoreSystem;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import SEPJ.Helper.*;

public class FileManageSystem {
	
	int uid ;
	int fileNum ;
	int file_list[];
	int return_list[];
	
	String prefix = "127.0.0.1/Files/";
	
	int getTotalNumber()
	{
		DBHelper dbh = new DBHelper("select COUNT(*) from FileSet;");
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
	
	public FileManageSystem(int x)
	{
		uid = x ;
		//Read configuration from database or files.
	}
	
	int checkValidity(File f)
	{
		if( f.fileSize > 10240*1024 ) // 10MB
			return 1 ;
		return 0 ;
	}
	
	public String uploadFile(File f)
	{
		if( checkValidity(f) == 1 )
			return "Too large file size!!";

		String target ;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date d = new Date();
		f.time = df.format(d);
		f.fid = getTotalNumber() + 1;
		f.path = f.uploadUid + "/" + f.fileName + "." + f.extentionName ;
		
		DBHelper dbh = new DBHelper("insert into FileSet(fID , fileName , fileExtName, fileIntroduction, filePath, fileSize, fileTime, uploadUid) values(?,?,?,?,?,?,?,?);");
		
		try {
			dbh.pst.setInt(1, f.fid);
			dbh.pst.setString(2, f.fileName);
			dbh.pst.setString(3, f.extentionName);
			dbh.pst.setString(4, f.introduction);
			dbh.pst.setString(5, f.path);
			dbh.pst.setDouble(6, f.fileSize);
			dbh.pst.setString(7, f.time);
			dbh.pst.setInt(8, f.uploadUid);
			dbh.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		target = prefix + f.path ;
		return target;
	}
	
	public String downloadFile(int fid)
	{
		String target = "No such file!";
		DBHelper dbh = new DBHelper("select filePath from FileSet where fID = ?;");
		try {
			dbh.pst.setInt(1, fid);
			ResultSet res = dbh.pst.executeQuery();
			while(res.next()) {
				target = prefix + res.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return target ;
	}
	
	public int deleteFile(int fid)
	{
		return 0 ;
	}
	
	public ArrayList<File> searchFile(File f)
	{
		ArrayList<File> result = new ArrayList<File>();
		DBHelper dbh ;
		String sql ;
		if( f.fid == -1 )
		{
			sql = "select * from FileSet where uploadUid = ?;" ;
			dbh = new DBHelper(sql) ;
			try {
				dbh.pst.setInt(1, uid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			sql = "select * from FileSet where fileName LIKE \'%" +f.fileName+ "%\' and fileIntroduction LIKE \'%" + f.introduction + "%\';";
			dbh = new DBHelper(sql);
		}
		
		try {
			ResultSet res = dbh.pst.executeQuery();
			
			while(res.next())
			{
				File tmpf = new File() ;
				tmpf.fid = res.getInt(1);
				tmpf.fileName = res.getString(2);
				tmpf.extentionName = res.getString(3);
				tmpf.introduction = res.getString(4);
				tmpf.path = res.getString(5);
				tmpf.fileSize = res.getDouble(6);
				tmpf.time = res.getString(7);
				tmpf.uploadUid = res.getInt(8);
				result.add(tmpf);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
		/*
		 * search file in database and return ;
		 */
		return result ;
	}
	
	public int accuseFile(int fid)
	{
		return 0;
	}
}
