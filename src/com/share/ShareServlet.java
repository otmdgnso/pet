package com.share;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

@WebServlet("/bbs/*")
public class ShareServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		
		ShareDAO dao = new ShareDAO();
		MyUtil util = new MyUtil();
		
		//�α��� ������ ���ǿ��� ��������
		HttpSession session=req.getSession();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		
		//uri�� ���� �۾�
		if (uri.indexOf("list.sst") != -1) {
			
			if(info==null) { // �α��ε��� ���� ���
				
				String msg2=" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �α��� �� ����Ͻ� �� �ֽ��ϴ�";
				req.setAttribute("message", msg2);
				
				String path="/WEB-INF/views/member/login.jsp";
				forward(req, resp, path);
				return ;
			}
			
			//�Խù� ����Ʈ
			String page = req.getParameter("page");
			int current_page = 1;
			if (page != null)
				current_page = Integer.parseInt(page);
            
			//�˻�
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			if (searchKey == null) {
				searchKey = "shareSubject";
				searchValue = "";
			}
			// GET ����� ��� ���ڵ�
			if (req.getMethod().equalsIgnoreCase("GET")) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}

			// ������ ���� ���ϱ�(��ü)
			int dataCount;
			if (searchValue.length()==0)
				dataCount=dao.dataCount();
			else
				dataCount=dao.dataCount(searchKey, searchValue);
            //��ü ������ �� 
			int numPerPage = 10;
			int total_page = util.pageCount(numPerPage, dataCount);
			if (current_page > total_page)
				current_page = total_page;
            //�Խù� ������ ���۰� ��
			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;
            //�Խù� ��������
 			List<ShareDTO> list;
			if(searchValue.length()==0)
				list=dao.listShare(start, end);
			else
				list=dao.listShare(start, end, searchKey, searchValue);

			// ����Ʈ �۹�ȣ
			int listShareNum, n = 0;
			Iterator<ShareDTO> it = list.iterator();
			while (it.hasNext()) {
				ShareDTO dto = it.next();
				listShareNum = dataCount - (start + n - 1);
				dto.setListShareNum(listShareNum);
				n++;
			}

			String params = "";
			if(searchValue.length()!=0) {
				params="searchKey=" +searchKey+ "&searchValue="
						+ URLEncoder.encode(searchValue, "UTF-8");
			}
			//����¡ ó��
			String listUrl = cp + "/bbs/list.sst";
			String articleUrl = cp + "/bbs/article.sst?page=" + current_page;
			if (params.length() != 0) {
				listUrl += "?" + params;
				articleUrl += "&" + params;
			}
			String paging = util.paging(current_page, total_page, listUrl);
            //�������� JSP�� �ѱ� �Ӽ�
			req.setAttribute("list", list);
			req.setAttribute("paging", paging);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("articleUrl", articleUrl);

			forward(req, resp, "/WEB-INF/views/bbs/list.jsp");
		} else if(uri.indexOf("created.sst")!=-1) {
			
			// �۾�����
			if(info == null){ //�α��� ���� ������� ,������������ �Ѿ
				
				resp.sendRedirect(cp+"/");
				return;
			}
			req.setAttribute("mode", "created");
			forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
		} else if(uri.indexOf("created_ok.sst")!=-1) {
			// �Խù� ����
			if(info == null){
			    
				resp.sendRedirect(cp+"/"); //�α��� ���� ������� �����������γѾ
				return;
			}
			
			ShareDTO dto= new ShareDTO();
			
			// userId�� ���ǿ� ����� ����
			dto.setMemId(info.getMemId());
			
			//�Ķ����
			dto.setShareContent(req.getParameter("shareContent"));
			dto.setShareSubject(req.getParameter("shareSubject"));
			
			dao.insertShare(dto);
			
			req.setAttribute("mode", "created");
			resp.sendRedirect(cp+ "/bbs/list.sst");
		} else if (uri.indexOf("article.sst") != -1) {
			//�ۺ���
	        if(info == null){
			    
				resp.sendRedirect(cp+"/"); //�α��� ���� ������� �����������γѾ
				return;
			}
			
	        //�Ķ���� : shareNum, page,[searchKey,searchValue]
			int shareNum = Integer.parseInt(req.getParameter("shareNum"));
			String page = req.getParameter("page");
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			if(searchKey==null) {
				searchKey="shareSubject";
				searchValue="";
			}
			searchValue=URLDecoder.decode(searchValue,"UTF-8");
            //��ȸ�� ����
			dao.ShareHitCount(shareNum);
           //�Խù� ��������
			ShareDTO dto = dao.readShare(shareNum);

			if (dto == null) { //�Խù� ������ �ٽ� ����Ʈ�� ��
				resp.sendRedirect(cp + "/bbs/list.sst?page=" + page);
				return;
			}

			int linesu = dto.getShareContent().split("\n").length;
			dto.setShareContent(dto.getShareContent().replaceAll("\n", "<br>"));
			
			//������ ������
			ShareDTO preReadDto=dao.preReadShare(shareNum, searchKey, searchValue);
			ShareDTO nextReadDto=dao.nextReadShare(shareNum, searchKey, searchValue);
			
			//����Ʈ�� ������/�����ۿ��� ����� �Ķ����
			String params = "page=" + page;
			if(searchValue.length()!=0) {
				params+="&searchKey=" +searchKey+ "&searchValue=" 
						+URLEncoder.encode(searchValue,"UTF-8");
			}

			// JSP�� ������ �Ӽ�
			req.setAttribute("dto", dto);
			req.setAttribute("preReadDto", preReadDto);
			req.setAttribute("nextReadDto", nextReadDto);
			req.setAttribute("params", params);
			req.setAttribute("linesu", linesu);
			req.setAttribute("page", page);

			forward(req, resp, "/WEB-INF/views/bbs/article.jsp");
		} else if (uri.indexOf("update.sst") != -1) {
			//���� ��
			int shareNum = Integer.parseInt(req.getParameter("shareNum"));
			String page=req.getParameter("page");
			
			ShareDTO dto = dao.readShare(shareNum);
			if(dto==null || ! dto.getMemId().equals(info.getMemId())) {
				resp.sendRedirect(cp+"/bbs/list.sst?page=" +page);
				return;
			}
		    
			req.setAttribute("dto", dto);
			req.setAttribute("mode", "update");
			req.setAttribute("page", page);
			forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
		} else if (uri.indexOf("update_ok.sst") != -1) {
			String page=req.getParameter("page");
			
			ShareDTO dto = new ShareDTO();
			dto.setShareNum(Integer.parseInt(req.getParameter("shareNum")));
			dto.setShareSubject(req.getParameter("shareSubject"));
			dto.setShareContent(req.getParameter("shareContent"));

			dao.ShareUpdate(dto);
			
			resp.sendRedirect(cp + "/bbs/article.sst?page="+page+ "&shareNum="+dto.getShareNum());
		} else if (uri.indexOf("delete.sst")!=-1) {
			String page=req.getParameter("page");
			int shareNum= Integer.parseInt(req.getParameter("shareNum"));
			
			ShareDTO dto=dao.readShare(shareNum);
			if(dto==null || (!dto.getMemId().equals(info.getMemId())
					&& !info.getMemId().equals("admin"))) {
				resp.sendRedirect(cp +"/bbs/list.sst?page=" +page);
				return;
			}
			
			dao.deleteShare(shareNum);
			resp.sendRedirect(cp +"/bbs/list.sst?page=" +page);
		} else if (uri.indexOf("listReply.sst")!=-1) {
			// ���� ����Ʈ ---------------------------------------
			int shareNum= Integer.parseInt(req.getParameter("shareNum"));
			String pageNo= req.getParameter("pageNo");// ����� ��������ȣ
			int current_page = 1;
			if (pageNo != null)
				current_page = Integer.parseInt(pageNo);
			
			int numPerPage = 5;
			int total_page = 0;
			int dataCount = 0;
			
			dataCount= dao.dataCountShareReply(shareNum);
			total_page = util.pageCount(numPerPage, dataCount);
			if (current_page > total_page)
				current_page = total_page;
			
			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;
			
			// ����Ʈ�� ����� ��� ������
			List<ShareReplyDTO> list= dao.listShareReply(shareNum, start, end);
			
			// ���͸� <br>
			Iterator<ShareReplyDTO> it= list.iterator();
			while(it.hasNext()) {
				ShareReplyDTO dto=it.next();
				dto.setShareR_content(dto.getShareR_content().replaceAll("\n", "<br>"));
			}
			
			// ����¡ó��(�μ�2�� ¥�� js�� ó��)
			String paging = util.paging(current_page, total_page);
			
			req.setAttribute("list", list);
			req.setAttribute("pageNo", current_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("total_page", total_page);
			req.setAttribute("paging", paging);
			
			// ������
			String path = "/WEB-INF/views/bbs/listReply.jsp";
			forward(req, resp, path);
		} else if(uri.indexOf("insertReply.sst") != -1){
			//���� �����ϱ� ------
			String state="true";
			if(info == null){ //�α��� ���� ���� ���
				state="loginFail";
			}else {
				int shareNum = Integer.parseInt(req.getParameter("shareNum"));
				ShareReplyDTO dto= new ShareReplyDTO();
				dto.setShareNum(shareNum);
				dto.setMemId(info.getMemId());
				dto.setShareR_content(req.getParameter("shareR_content"));
				
				int result=dao.insertShareReply(dto);
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
		} else if(uri.indexOf("deleteReply.sst")!= -1){
			//���� ����-----------------------
			int shareR_num = Integer.parseInt(req.getParameter("shareR_num"));
			String memId=req.getParameter("memId");
			
			String state="false";
			if(info == null){ //�α��� ���� ���� ���
				state= "loginFail";				
			} else if(info.getMemId().equals("admin") || info.getMemId().equals(memId)){
				dao.deleteShareReply(shareR_num);
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
 
		
		
		
		
		
		
		
		
		
		
	}

}
