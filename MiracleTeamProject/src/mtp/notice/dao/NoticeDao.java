package mtp.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mtp.notice.dto.NoticeDto;

public class NoticeDao {
	
	private Connection conn;

	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public List<NoticeDto> selectList() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT NO, TITLE, WRITER, CONTEXT";
		sql += " FROM NOTICE_POST";
		sql += " ORDER BY NO ASC";

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			ArrayList<NoticeDto> noticeList = new ArrayList<NoticeDto>();
			
			int no = 0;
			String title = "";
			String writer = "";
			String context = "";

			while (rs.next()) {
				no = rs.getInt("NO");
				title = rs.getString("TITLE");
				writer = rs.getString("WRITER");
				context = rs.getString("CONTEXT");

				NoticeDto noticeDto = new NoticeDto(no, title, writer, context);

				noticeList.add(noticeDto);
			}

			return noticeList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;

		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} // finally End

	} // SelectList End
	
	public int noticeInsert(NoticeDto noticeDto) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		try {
			String title = noticeDto.getTitle();
			String writer = noticeDto.getWriter();
			String context = noticeDto.getContext();
			
			String sql = "INSERT INTO NOTICE_POST"; 
				   sql += " (NO, TITLE, WRITER, CONTEXT)";
				   sql += " VALUES(NO_NOTICE_CHECK.NEXTVAL";
				   sql += ", ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, writer);
			pstmt.setString(3, context);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} // finally 종료

		
		return result;
	}
	
	public NoticeDto noticeSelectOne(int no) throws Exception {		
		NoticeDto noticeDto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";

		sql = "SELECT TITLE, WRITER, CONTEXT";
		sql += " FROM NOTICE_POST";
		sql += " WHERE NO =?";
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			String title = "";
			String writer = "";
			String context = "";

			if (rs.next()) {
				title = rs.getString("TITLE");
				writer = rs.getString("WRITER");
				context = rs.getString("CONTEXT");

				noticeDto = new NoticeDto();

				noticeDto.setNo(no);
				noticeDto.setTitle(title);
				noticeDto.setWriter(writer);
				noticeDto.setContext(context);
			} else {
				throw new Exception("게시물이 없습니다.");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {

			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} // finally 종료
		
		return noticeDto;
	}
	
	public int noticeUpdate(NoticeDto noticeDto) throws SQLException {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "";
		sql = "UPDATE NOTICE_POST";
		sql += " SET TITLE=?, CONTEXT=?";
		sql += " WHERE NO =?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, noticeDto.getTitle());
			pstmt.setString(2, noticeDto.getContext());
			pstmt.setInt(3, noticeDto.getNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} // finally 종료
		
		return result;
	} // noticeUpdate End
	
	public int noticeDelete(int no) throws SQLException {
		int result = 0;	
		PreparedStatement pstmt = null;

		try {
			String sql = "";
			sql = "DELETE FROM NOTICE_POST";
			sql += " WHERE NO = ?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, no);			
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {

			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} // finally 종료
		
		return result;
	}
	
}
