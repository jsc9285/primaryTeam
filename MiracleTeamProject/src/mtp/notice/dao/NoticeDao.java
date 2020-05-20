package mtp.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	
}
