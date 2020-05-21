package mtp.boardManageServlet;

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

import mtp.boardManageDao.BoardManagementDao;
import mtp.boardManageDto.BoardManagementDto;

@WebServlet(value="/boardManagement/list")
public class BoardManagementList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");
			
			BoardManagementDao boardManagementDao = new BoardManagementDao();
			boardManagementDao.setConnection(conn);
			
			ArrayList<BoardManagementDto> boardManagementList = null;
			
			// 데이터베이스에서 회원 정보를 가져온다
			boardManagementList = boardManagementDao.selectList();
			
			// request에 회원 목록 데이터 보관한다
			req.setAttribute("boardManagementList", boardManagementList);

			res.setContentType("text/html");
			res.setCharacterEncoding("UTF-8");
			
			//jsp로 출력을 위임한다
			RequestDispatcher dispatcher = 
					req.getRequestDispatcher("./BoardListForm.jsp");
			
			dispatcher.forward(req, res);
		} catch (Exception e) {
			req.setAttribute("error", e);
			RequestDispatcher dispatcher = 
					req.getRequestDispatcher("/Error.jsp");
			dispatcher.forward(req, res);
			
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
}
