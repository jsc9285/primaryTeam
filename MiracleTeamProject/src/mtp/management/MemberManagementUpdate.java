package mtp.management;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mtp.dao.MemberDao;
import mtp.dto.MemberDto;

@WebServlet(value="/memberManagement/update")
public class MemberManagementUpdate extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		RequestDispatcher rd = null;

		String mNo = "";

		try {
			mNo = req.getParameter("no");
			int no = Integer.parseInt(mNo);
			
			ServletContext sc = this.getServletContext();

			conn = (Connection) sc.getAttribute("conn");
			
			MemberDao memberDao = new MemberDao();
			memberDao.setConnection(conn);
			
			MemberDto memberDto = memberDao.memberSelectThis(no);
//			MemberDto adminDto = memberDao.adminSelectThis(adNo);
			
			req.setAttribute("memberDto", memberDto);
//			req.setAttribute("adminDto", adminDto);
			rd = req.getRequestDispatcher("./MemberManagementUpdateView.jsp");
			rd.forward(req, res);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, 
		HttpServletResponse res)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDto memberDto = null;
		
		Connection conn = null;
		
		try {
			String email = req.getParameter("email");
			String name = req.getParameter("name");
			String pwd = req.getParameter("password");
			String mNo = req.getParameter("no");
			int no = Integer.parseInt(mNo);
			
			memberDto = new MemberDto();
			memberDto.setEmail(email);
			memberDto.setName(name);
			memberDto.setPassword(pwd);
			memberDto.setNo(no);
			
			ServletContext sc = this.getServletContext();

			conn = (Connection) sc.getAttribute("conn");

			MemberDao memberDao = new MemberDao();
			memberDao.setConnection(conn);
			
//			int admin = memberDao.adminManagementUpdate(memberDto);
			int result = memberDao.memberManagementUpdate(memberDto);

//			if(admin == 0) {
//				System.out.println("관리자 정보 조회가 실패하였습니다.");
//			}
			
			if(result == 0){
				System.out.println("회원 정보 조회가 실패하였습니다.");
			}
			
			res.sendRedirect("./list");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
//			req.setAttribute("error", e);
//			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
//			rd.forward(req, res);
		} 

	}
}
