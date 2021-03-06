package mtp.notice.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mtp.notice.dao.NoticeDao;
import mtp.notice.dto.NoticeDto;

@WebServlet(value = "/noticeBoard/select")
public class NoticeSelectServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse res) 
					throws ServletException, IOException {
		
		Connection conn = null;
		
		try {
			// 연결 
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");
			
			// DB 연결( 게시물정보(NoticeDto) )		
			NoticeDao noticeDao = new NoticeDao();
			noticeDao.setConnection(conn);
			
			int no = Integer.parseInt(req.getParameter("no"));
			String page = req.getParameter("page");
			
			// no를 활용하여 업데이트 선택된 정보가 출력되게 !
			NoticeDto noticeDto = new NoticeDto();
			
			noticeDto = noticeDao.noticeSelectOne(no);
			
	        req.setAttribute("page", page);
			req.setAttribute("noticeDto", noticeDto);

			// 공지사항게시판폼으로 이동
			RequestDispatcher rd = 
					req.getRequestDispatcher("./noticeBoardSelect.jsp");
			rd.forward(req, res);
		} catch (Exception e) {
			req.setAttribute("error", e);
			RequestDispatcher rd = 
					req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, res);
		} // catch End
	}
	
	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse res) 
					throws ServletException, IOException {
		
	}
}
