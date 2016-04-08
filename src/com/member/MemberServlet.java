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
		
		MemberDAO dao=new MemberDAO();
		
		// ���ǰ�ü. ���� ������ ������ ����(�α�������, ���ѵ�������)
		HttpSession session=req.getSession();
		
		if(uri.indexOf("member.do")!=-1) {
			// ȸ��������
			req.setAttribute("title", "ȸ�� ����");
			req.setAttribute("mode", "created");
			String path="/WEB-INF/views/member/member.jsp";
			forward(req, resp, path);
			
		} else if(uri.indexOf("member_ok.do")!=-1) {
			// ȸ������ ó��
			MemberDTO dto = new MemberDTO();
		
			dto.setMemId(req.getParameter("userId"));
			dto.setMemPwd(req.getParameter("userPwd"));
			dto.setMemName(req.getParameter("userName"));
			
			String course = req.getParameter("selectCourse");
			String kisu= req.getParameter("kisu");
			if(course!=null && kisu!=null && course.length() != 0 && kisu.length() != 0 )
				dto.setMemCourse(course+"_"+kisu+"��_"+dto.getMemName());
			
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
			//�ּҴ� �ϴ� �̷��� 
			dto.setAddr2(req.getParameter("addr2"));
			
			//////////////////////////////////////////////////INSERT MEMBER ����߰� 
			int result = dao.insertMember(dto);
			
			if (result != 1) {
				String message = "ȸ�� ���Կ� �����߾�� ��..��;; ";
				
				req.setAttribute("title", "ȸ�� ����");
				req.setAttribute("mode", "created");
				req.setAttribute("message", message);
				
				req.setAttribute("failed", "true");
				req.setAttribute("message", message);
				
				forward(req, resp, "/WEB-INF/views/member/member.jsp");
				return;
			}
			System.out.println("ȸ������ �Ϸ� !!!!!!");
			StringBuffer sb=new StringBuffer();
			sb.append("<b>"+dto.getMemName()+ " </b>�� ȸ�������� �Ǿ����ϴ�.<br>");
			sb.append("����ȭ������ �̵��Ͽ� �α��� �Ͻñ� �ٶ��ϴ�.<br>");
			
			req.setAttribute("title", "ȸ�� ����");
			req.setAttribute("message", sb.toString());
			
			forward(req, resp, "/WEB-INF/views/member/complete.jsp");
			
		}
		//dao. readMember �ʿ� 
		else if(uri.indexOf("login_ok.do")!=-1) {
	
			// �α��� ó��
			String memId=req.getParameter("userId");
			String memPwd=req.getParameter("userPwd");
			
			MemberDTO dto=dao.readMember(memId);
			
			
			// �α��� ���� : �α��������� ������ ����
			if(dto!=null) {
				if(memPwd.equals(dto.getMemPwd()) && dto.getEnabled()==1) {

					// ������ �����ð��� 20�м���(�⺻ 30��)
					session.setMaxInactiveInterval(20*60);
					
					// ���ǿ� ������ ����
					SessionInfo info=new SessionInfo();
					
					info.setMemId(dto.getMemId());
					info.setMemName(dto.getMemName());
					
					// ���ǿ� member�̶�� �̸����� ����
					session.setAttribute("member", info);
					System.out.println("�����α���  ");
					// ����ȭ������ �����̷�Ʈ
					resp.sendRedirect(cp);
					return;
				} 
			}
			
			// �α��� ������ ���(�ٽ� �α��� ������)
			else {				
				String msg="���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�.";
				req.setAttribute("message", msg);
				
				String path="/WEB-INF/views/member/login.jsp";
				forward(req, resp, path);
			}
			
		} else if(uri.indexOf("logout.do")!=-1) {
			// �α׾ƿ�
			// ���ǿ� ����� ������ �����
			session.removeAttribute("member");
			
			// ���ǿ� ����� ��� ������ ����� ������ �ʱ�ȭ �Ѵ�.
			session.invalidate();
			
			// ��Ʈ�� �����̷�Ʈ
			resp.sendRedirect(cp);
			
		} 
	}
}
