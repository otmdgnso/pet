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
		
		if(uri.indexOf("member.sst")!=-1) {
			// ȸ��������
			req.setAttribute("title", "ȸ�� ����");
			req.setAttribute("mode", "created");
			String path="/WEB-INF/views/member/member.jsp";
			forward(req, resp, path);
			
		} else if(uri.indexOf("member_ok.sst")!=-1) {
			// ȸ������ ó��
			MemberDTO dto = new MemberDTO();
		
			dto.setMemId(req.getParameter("memId"));
			dto.setMemPwd(req.getParameter("memPwd"));
			dto.setMemName(req.getParameter("memName"));
			
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
				String message = "ȸ�����Կ� �����߾��! �ٸ� ���̵� �������ּ���  "; //���߿� �ߺ� Ȯ�� 
				
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
		//////////////////////////////////////////////////////////////////////////////////	�α��� ///////////////////
		//dao. readMember �ʿ� 
		else if(uri.indexOf("login.sst")!=-1) {
			// �α��� ��
			String path="/WEB-INF/views/member/login.jsp";
			forward(req, resp, path);
			
		}
		else if(uri.indexOf("login_ok.sst")!=-1) {
						
			// �α��� ó��
			String memId=req.getParameter("memId");
			String memPwd=req.getParameter("memPwd");
			
			MemberDTO dto=dao.readMember(memId);
			
			// �α��� �����ߴٸ� : �α��������� ������ ����
			if(dto!=null) {

				if(memPwd.equals(dto.getMemPwd()) && dto.getEnabled()==1) {

					System.out.println("login_ok�̴� ");
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
						
				String msg="���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�";
				req.setAttribute("message", msg);
				
				String path="/WEB-INF/views/member/login.jsp";
				forward(req, resp, path);
			
			
		} else if(uri.indexOf("logout.sst")!=-1) {
			// �α׾ƿ�
			// ���ǿ� ����� ������ �����
			session.removeAttribute("member");
			
			// ���ǿ� ����� ��� ������ ����� ������ �ʱ�ȭ �Ѵ�.
			session.invalidate();
			
			// ��Ʈ�� �����̷�Ʈ
			resp.sendRedirect(cp);
			
		}
		///////////////////////////////////////////////////////////////////////// �������� Ȥ�� ���� //////////////////////////
		else if(uri.indexOf("pwd.sst")!=-1) {
			// �н����� Ȯ�� ��
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			System.out.println("pwd.sst�̴�");
			if(info==null) {
				// �α׾ƿ������̸�
				forward(req, resp, "/WEB-INF/views/member/login.jsp");
			}
			
			String mode=req.getParameter("mode");
			if(mode.equals("update"))
				
				req.setAttribute("title", "ȸ�� ���� ����");
			else
				req.setAttribute("title", "ȸ�� Ż��");
			
			req.setAttribute("mode", mode);
			forward(req, resp, "/WEB-INF/views/member/pwd.jsp");
			
		} 
		
		else if(uri.indexOf("pwd_ok.sst")!=-1) {
			// �н����� Ȯ��
			System.out.println("pwd_ok.sst�̴�");
			//////////////////info�� �α����� ����� ������ �����´� !
			
			//info�� session�� ����� �α��������� �ѱ�
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			if(info==null) { //�α׾ƿ� �� ���
				resp.sendRedirect(cp+"/member/login.sst");
				return;
			}
			
			// DB���� �ش� ȸ�� ���� ��������
			MemberDTO dto=dao.readMember(info.getMemId());
			
			if(dto==null) {
				session.invalidate();
				resp.sendRedirect(cp);
				return;
			}
			
			String memPwd=req.getParameter("memPwd");
			String mode=req.getParameter("mode");
			System.out.println("��й�ȣ�� ������ ");
			
			if(! dto.getMemPwd().equals(memPwd)) {
				
				System.out.println("��й�ȣ�� ���� ���� ���  ");
				
				if(mode.equals("update"))
					req.setAttribute("title", "ȸ�� ���� ����");
				else
					req.setAttribute("title", "ȸ�� Ż��");
				
				req.setAttribute("mode", mode);
				req.setAttribute("message", "<span style='text-align:center; color:tomato; font-weight:bold; font-size:13px;' class='form-control-static '>"
						+ "�н����尡 ��ġ���� �ʽ��ϴ� !</span>");
				
				forward(req, resp, "/WEB-INF/views/member/pwd.jsp");
				
				return;
			}
			
			if(mode.equals("delete")) {
				// ȸ��Ż��
				dao.deleteMember(info.getMemId());
				
				session.removeAttribute("member");
				session.invalidate();
				
				StringBuffer sb=new StringBuffer();
				sb.append("<b>"+dto.getMemName()+ "</b>�� ȸ��Ż�� ����ó���Ǿ����ϴ�.<br>");
				sb.append("�׵��� �̿��� �ּż� �����մϴ�.<br>");
				
				req.setAttribute("title", "ȸ�� Ż��");
				req.setAttribute("message", sb.toString());
				
				forward(req, resp, "/WEB-INF/views/member/complete.jsp");
				
				return;
			}
			
			// ȸ����������
			if(dto.getTel()!=null) {
				String []s=dto.getTel().split("-");
				if(s.length==3) {
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}			
			
			if(dto.getMemCourse()!=null) {
				String []s=dto.getMemCourse().split("_");
				System.out.println(s);
				if(s.length==3) {
					dto.setCourse(s[0]);
					dto.setKisu(s[1]);
					
				}
			}
			
			// ȸ������������ �̵�
			req.setAttribute("title", "ȸ�� ���� ����");

			req.setAttribute("dto", dto);

			req.setAttribute("mode", "update");
			forward(req, resp, "/WEB-INF/views/member/member.jsp");
			
		}
		 else if(uri.indexOf("update_ok.sst")!=-1) {
				// ȸ������ ���� �Ϸ�
				SessionInfo info=(SessionInfo)session.getAttribute("member");
				if(info==null) { //�α׾ƿ� �� ���
					resp.sendRedirect(cp+"/member/login.sst");
					return;
				}
				
				MemberDTO dto = new MemberDTO();

				dto.setMemId(req.getParameter("memId"));
				dto.setMemPwd(req.getParameter("memPwd"));
				dto.setMemName(req.getParameter("memName"));
				
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
				
				System.out.println("��й�ȣ: "+dto.getMemPwd());
				
				int return1= dao.updateMember(dto);
				System.out.println("���:"+return1);
				
				StringBuffer sb=new StringBuffer();
				sb.append("<b>"+dto.getMemName()+ "</b>�� ȸ�� ������ ���� �Ǿ����ϴ�.<br>");
				sb.append("����ȭ������ �̵� �Ͻñ� �ٶ��ϴ�.<br>");
				
				req.setAttribute("title", "ȸ�� ���� ����");
				req.setAttribute("message", sb.toString());
				
				forward(req, resp, "/WEB-INF/views/member/complete.jsp");
			}
		}
	
	
	}

