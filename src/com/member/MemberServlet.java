package com.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MyServlet;

@WebServlet("/member/*")
public class MemberServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String uri=req.getRequestURI();
		String cp=req.getContextPath();
		
		//MemberDAO dao=new MemberDAO();
		
		// 세션객체. 세션 정보는 서버에 저장(로그인정보, 권한등을저장)
		HttpSession session=req.getSession();
		
		if(uri.indexOf("member.do")!=-1) {
			// 회원가입폼
			req.setAttribute("title", "회원 가입");
			req.setAttribute("mode", "created");
			String path="/WEB-INF/views/member/member.jsp";
			forward(req, resp, path);
			
		} else if(uri.indexOf("member_ok.do")!=-1) {
			// 회원가입 처리
		/*//	MemberDTO dto = new MemberDTO();

		
		
			
			dto.setMemId(req.getParameter("userId"));
			dto.setMemPwd(req.getParameter("userPwd"));
			dto.setMemName(req.getParameter("userName"));
			
			String course = req.getParameter("selectCourse");
			String kisu= req.getParameter("kisu");
			if(course!=null && kisu!=null && course.length() != 0 && kisu.length() != 0 )
				dto.setMemCourse(course+"_"+kisu+"기");
			
			dto.setBirth(req.getParameter("birth"));
			
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			if (email1 != null && email1.length() != 0 && email2 != null && email2.length() != 0 ) {
				dto.setEmail(email1 + email2);
			}
			
			String tel1 = req.getParameter("tel1");
			String tel2 = req.getParameter("tel2");
			String tel3 = req.getParameter("tel3");
			if (tel1 != null && tel1.length() != 0 && tel2 != null
					&& tel2.length() != 0 && tel3 != null && tel3.length() != 0) {
				dto.setTel(tel1 + "-" + tel2 + "-" + tel3);
			}
			
			dto.setJob(req.getParameter("job"));
			dto.setZip(req.getParameter("zip"));
			dto.setAddr2(req.getParameter("addr2"));
			
			int result = dao.insertMember(dto);
			if (result != 1) {
				String message = "회원 가입이 실패 했습니다.";

				req.setAttribute("title", "회원 가입");
				req.setAttribute("mode", "created");
				req.setAttribute("message", message);
				forward(req, resp, "/WEB-INF/views/member/member.jsp");
				return;
			}

			StringBuffer sb=new StringBuffer();
			sb.append("<b>"+dto.getMemName()+ "</b>님 회원가입이 되었습니다.<br>");
			sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
			
			req.setAttribute("title", "회원 가입");
			req.setAttribute("message", sb.toString());
			
			forward(req, resp, "/WEB-INF/views/member/complete.jsp");
			*/
		}
	}
}
