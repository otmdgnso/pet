package com.free;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.SessionInfo;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/free/*")
public class FreeServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unused")
	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri=req.getRequestURI();
		String cp=req.getContextPath();
		
		HttpSession session=req.getSession();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		FreeDAO dao=new FreeDAO();
		MyUtil util=new MyUtil();
		
		if(info==null) { // �α��ε��� ���� ���
			
			String msg2=" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �α��� �� ����Ͻ� �� �ֽ��ϴ�";
			req.setAttribute("message", msg2);
			
			String path="/WEB-INF/views/member/login.jsp";
			forward(req, resp, path);
			return ;
		}
		
		if(uri.indexOf("free.sst")!=-1) {
			// �Ѿ�� ������
			String page=req.getParameter("page");
			int current_page=1;
			if(page!=null && page.length()!=0)
				current_page=Integer.parseInt(page);
			
			// ��ü ������ ����
			int dataCount=dao.dataCount();
			
			// ��ü�������� ���ϱ�
			int numPerPage=5;
			int total_page=util.pageCount(numPerPage, dataCount);
			
			// ��ü���������� ǥ���� �������� ū���
			if(total_page<current_page)
				current_page=total_page;
			
			// �����õ������� ���۰� ��
			int start=(current_page-1)*numPerPage+1;
			int end=current_page*numPerPage;
			
			// ������ ��������
			List<FreeDTO> list=dao.listFree(start, end);
			
			Iterator<FreeDTO> it=list.iterator();
			
			while (it.hasNext()) {
				FreeDTO dto=it.next();
				
				dto.setFreeContent(dto.getFreeContent().replaceAll(">", "&gt;"));
				dto.setFreeContent(dto.getFreeContent().replaceAll("<", "&lt;"));
				dto.setFreeContent(dto.getFreeContent().replaceAll("\n", "<br>"));
			}
			
			// ����¡ó��
			String strUrl=cp+"/free/free.sst";
			String paging=util.paging(	current_page, total_page, strUrl);
			
			// guest.jsp�� �Ѱ��� ������
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("paging", paging);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("total_page", total_page);
			
			forward(req, resp, "/WEB-INF/views/free/free.jsp");
			
		} else if(uri.indexOf("free_ok.sst")!=-1) {
			// ���� ����
			
			FreeDTO dto=new FreeDTO();
			
			dto.setMemId(info.getMemId());
			dto.setFreeContent(req.getParameter("content"));
			
			dao.insertFree(dto);
			
			resp.sendRedirect(cp+"/free/free.sst");
			
		} else if(uri.indexOf("delete.sst")!=-1) {
			// ���� ����
			
			int num=Integer.parseInt(req.getParameter("num"));
			String page=req.getParameter("page");
			String uid=req.getParameter("uid");

			if(! uid.equals(info.getMemId()) && ! info.getMemId().equals("admin")) {
				resp.sendRedirect(cp+"/free/free.sst?page="+page);
				return;
			}
			dao.deleteFree(num);			
			resp.sendRedirect(cp+"/free/free.sst?page="+page);
		}
		
		
		// ���� ����Ʈ -------------------------------------------------------------------------------
		/*else if (uri.indexOf("freeReply.sst")!=-1) {
			
			int freeNum= Integer.parseInt(req.getParameter("freeNum"));
			String pageNo= req.getParameter("pageNo");// ����� ��������ȣ
			int current_page = 1;
			if (pageNo != null)
				current_page = Integer.parseInt(pageNo);
			
			int numPerPage = 5;
			int total_page = 0;
			int dataCount = 0;
			
			dataCount= dao.dataCountFreeReply(freeNum);
			total_page = util.pageCount(numPerPage, dataCount);
			if (current_page > total_page)
				current_page = total_page;
			
			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;
			
			// ����Ʈ�� ����� ��� ������
			List<FreeReplyDTO> list= dao.listFreeReply(freeNum, start, end);
			
			// ���͸� <br>
			Iterator<FreeReplyDTO> it= list.iterator();
			
			while(it.hasNext()) {
				FreeReplyDTO dto=it.next();
				dto.setFreeR_content(dto.getFreeR_content().replaceAll("\n", "<br>"));
			}
			
			// ����¡ó��(�μ�2�� ¥�� js�� ó��)
			String paging = util.paging(current_page, total_page);
			
			req.setAttribute("list", list);
			req.setAttribute("pageNo", current_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("total_page", total_page);
			req.setAttribute("paging", paging);
			
			// ������
			String path = "/WEB-INF/views/free/freeReply.jsp";
			forward(req, resp, path);
			
		} 
		//���� �����ϱ� ------------------------------------------------------------------------------------
		else if(uri.indexOf("insertReply.sst") != -1){
			
			String state="true";
			if(info == null){ //�α��� ���� ���� ���
				state="loginFail";
			}else {
				int freeNum = Integer.parseInt(req.getParameter("freeNum"));
				FreeReplyDTO dto= new FreeReplyDTO();
				dto.setFreeNum(freeNum);
				dto.setMemId(info.getMemId());
				dto.setFreeR_content(req.getParameter("freeR_content"));
				
				int result=dao.insertFreeReply(dto);
				if(result==0)
					state="false";
			}
			StringBuffer sb=new StringBuffer();
			sb.append("{");
			sb.append("\"state\":"+"\""+state+"\"");
			sb.append("}");
			
			resp.setContentType("text/html);charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.println(sb.toString());
		} 
		//���� ����-------------------------------------------------------------------------------------
		else if(uri.indexOf("deleteReply.sst")!= -1){
			
			int freeR_num = Integer.parseInt(req.getParameter("freeR_num"));
			String memId=req.getParameter("memId");
			
			String state="false";
			if(info == null){ //�α��� ���� ���� ���
				state= "loginFail";				
			}
			else if(info.getMemId().equals("admin") || info.getMemId().equals(memId)){
				dao.deleteFreeReply(freeR_num);
				state="true";
				
			}
			StringBuffer sb=new StringBuffer();
			sb.append("{");
			sb.append("\"state\":"+"\""+state+"\"");
			sb.append("}");

			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.println(sb.toString());
		}
 
	*/	
	}

}
