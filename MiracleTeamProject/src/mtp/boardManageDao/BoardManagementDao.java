package mtp.boardManageDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mtp.boardManageDto.BoardManagementDto;

public class BoardManagementDao {

	private Connection conn;

	   public void setConnection(Connection conn) {
	      this.conn = conn;
	   }

	   public ArrayList<BoardManagementDto> selectList() throws Exception {
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      String sql = "";

	      		 sql += "SELECT NO, TITLE, WRITER";
	      		 sql += " FROM BOARD_POST";
	      		 sql += " ORDER BY NO ASC";

	      try {
	         pstmt = conn.prepareStatement(sql);

	         rs = pstmt.executeQuery();

	         ArrayList<BoardManagementDto> boardManagementList = 
	            new ArrayList<BoardManagementDto>();
	         
	         int no = 0;
	         String title = "";
	         String writer = "";
	         
	         while (rs.next()) {
	        	 no = Integer.parseInt(rs.getString("NO"));
	        	title = rs.getString("TITLE");
	        	writer = rs.getString("WRITER");

	            BoardManagementDto boardManagementDto = 
	               new BoardManagementDto(no, writer, title);

	            boardManagementList.add(boardManagementDto);
	         }

	         return boardManagementList;
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

	      }

	   }
	   
	   public int boardManagementWrite(BoardManagementDto boardManagementDto) throws Exception {
		      int result = 0;
		      PreparedStatement pstmt = null;

		      try {
		         String writer = boardManagementDto.getWriter();
		         String title = boardManagementDto.getTitle();
		         String context = boardManagementDto.getContext();
		         
		         String sql = "";
		         
		         sql += "INSERT INTO BOARD_POST";
		         sql += " (NO, TITLE, WRITER, CONTEXT)";
		         sql += " VALUES(NO_BOARD_CHECK.NEXTVAL, ?, ?, ?)";
		     
		         pstmt = conn.prepareStatement(sql);

		         pstmt.setString(1, title);
		         pstmt.setString(2, writer);
		         pstmt.setString(3, context);

		         result = pstmt.executeUpdate();

		      } catch (Exception e) {
		         // TODO Auto-generated catch block
		         throw e;
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

	   public BoardManagementDto boardSelectOne(int no) throws Exception {

		   	  BoardManagementDto boardManagementDto = null;

		      PreparedStatement pstmt = null;
		      ResultSet rs = null;

		      String sql = "";

		      sql += "SELECT WRITER, TITLE, CONTEXT";
	      	  sql += " FROM BOARD_POST";
	      	  sql += " WHERE NO = ?";
	      	  
	      	  String writer = "";

		      try {
		         pstmt = conn.prepareStatement(sql);

		         pstmt.setInt(1, no);

		         rs = pstmt.executeQuery();

		         String title = "";
		         String context = "";

		         if (rs.next()) {
		        	writer = rs.getString("WRITER");
		        	title = rs.getString("TITLE");
		        	context = rs.getString("CONTEXT");
//		        	no = rs.getInt("NO");	

		            boardManagementDto = new BoardManagementDto();

		            boardManagementDto.setWriter(writer);
		            boardManagementDto.setTitle(title);
		            boardManagementDto.setContext(context);
		            boardManagementDto.setNo(no);
		            
		         } else {
		            throw new Exception("해당 번호의 회원을 찾을 수 없습니다.");
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
		      return boardManagementDto;
		   }
	   
	   public int boardUpdate(BoardManagementDto boardManagementDto) throws SQLException {
		      int result = 0;

		      PreparedStatement pstmt = null;

		      String sql = "";
		      
		      sql = "UPDATE BOARD_POST";
		      sql += " SET WRITER=?, TITLE=?, CONTEXT=?";
		      sql += " WHERE NO =?";

		      try {
		         pstmt = conn.prepareStatement(sql);
		         
		         pstmt.setString(1, boardManagementDto.getWriter());
		         pstmt.setString(2, boardManagementDto.getTitle());
		         pstmt.setString(3, boardManagementDto.getContext());
		         pstmt.setInt(4, boardManagementDto.getNo());

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
	   
	   public int boardDelete(int no) throws SQLException {
		      int result = 0;

		      PreparedStatement pstmt = null;

		      String sql = "";
		      sql = "DELETE FROM BOARD_POST";
		      sql += " WHERE NO = ?";

		      try {
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
