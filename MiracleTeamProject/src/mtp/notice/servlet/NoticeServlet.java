package mtp.notice.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mtp.login.dao.MemberDao;
import mtp.login.dto.MemberDto;
import mtp.notice.dao.NoticeDao;
import mtp.notice.dto.NoticeDto;

@WebServlet(value = "/noticeBoard/list")
public class NoticeServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse res) 
					throws ServletException, IOException {
		
		Connection conn = null;
				
		try {
			// 연결 
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");
			
			// DB 연결( 회원정보(MemberDto), 게시물정보(NoticeDto) )
			MemberDao memberDao = new MemberDao();
			memberDao.setConnection(conn);
			
			MemberDto memberDto = new MemberDto();
			
			memberDto = memberDao.memberSelectOne(1);
			
			req.setAttribute("memberDto", memberDto);
			// 아래는 게시판
			NoticeDao noticeDao = new NoticeDao();
			noticeDao.setConnection(conn);
			
			// 게시물 정보 읽기 ( 			
			ArrayList<NoticeDto> noticeList = null;
			noticeList = (ArrayList<NoticeDto>)noticeDao.selectList();
			
			// 데이터 전달을 위해 request에  데이터 보관
			req.setAttribute("noticeList", noticeList);
			
			// 공지사항게시판폼으로 이동
			RequestDispatcher rd = 
					req.getRequestDispatcher("./noticeBoardForm.jsp");
			rd.forward(req, res);
		} catch (Exception e) {
			req.setAttribute("error", e);
			RequestDispatcher rd = 
					req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, res);
		} // catch End
		
	} // doGet End
	
	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse res) 
					throws ServletException, IOException {

	}
	
}
