package com.docu;

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

@WebServlet("/docu/*")
public class DocuServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		
		DocuDAO dao = new DocuDAO();
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
				searchKey = "docuSubject";
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
 			List<DocuDTO> list;
			if(searchValue.length()==0)
				list=dao.listDocu(start, end);
			else
				list=dao.listDocu(start, end, searchKey, searchValue);

			// ����Ʈ �۹�ȣ
			int listDocuNum, n = 0;
			Iterator<DocuDTO> it = list.iterator();
			while (it.hasNext()) {
				DocuDTO dto = it.next();
				listDocuNum = dataCount - (start + n - 1);
				dto.setListDocuNum(listDocuNum);
				n++;
			}

			String params = "";
			if(searchValue.length()!=0) {
				params="searchKey=" +searchKey+ "&searchValue="
						+ URLEncoder.encode(searchValue, "UTF-8");
			}
			//����¡ ó��
			String listUrl = cp + "/docu/list.sst";
			String articleUrl = cp + "/docu/article.sst?page=" + current_page;
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

			forward(req, resp, "/WEB-INF/views/docu/list.jsp");
		} else if(uri.indexOf("created.sst")!=-1) {
			
			// �۾�����
			if(info == null){ //�α��� ���� ������� ,������������ �Ѿ
				
				resp.sendRedirect(cp+"/");
				return;
			}
			req.setAttribute("mode", "created");
			forward(req, resp, "/WEB-INF/views/docu/created.jsp");
		} else if(uri.indexOf("created_ok.sst")!=-1) {
			// �Խù� ����
			if(info == null){
			    
				resp.sendRedirect(cp+"/"); //�α��� ���� ������� �����������γѾ
				return;
			}
			
			DocuDTO dto= new DocuDTO();
			
			// userId�� ���ǿ� ����� ����
			dto.setMemId(info.getMemId());
			
			//�Ķ����
			dto.setDocuContent(req.getParameter("docuContent"));
			dto.setDocuSubject(req.getParameter("docuSubject"));
						
			dao.insertDocu(dto);
			req.setAttribute("mode", "created");
			resp.sendRedirect(cp+ "/docu/list.sst");
		} else if (uri.indexOf("article.sst") != -1) {
			//�ۺ���
	        if(info == null){
			    
				resp.sendRedirect(cp+"/"); //�α��� ���� ������� �����������γѾ
				return;
			}
			
	        //�Ķ���� : docuNum, page,[searchKey,searchValue]
			int docuNum = Integer.parseInt(req.getParameter("docuNum"));
			String page = req.getParameter("page");
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			int dataCount= dao.dataCount(docuNum, info.getMemId());
			if(searchKey==null) {
				searchKey="docuSubject";
				searchValue="";
			}
			searchValue=URLDecoder.decode(searchValue,"UTF-8");
            //��ȸ�� ����
			dao.DocuHitCount(docuNum);
           //�Խù� ��������
			DocuDTO dto = dao.readDocu(docuNum);

			if (dto == null) { //�Խù� ������ �ٽ� ����Ʈ�� ��
				resp.sendRedirect(cp + "/docu/list.sst?page=" + page);
				return;
			}

			int linesu = dto.getDocuContent().split("\n").length;
			dto.setDocuContent(dto.getDocuContent().replaceAll("\n", "<br>"));
			
			//������ ������
			DocuDTO preReadDto=dao.preReadDocu(docuNum, searchKey, searchValue);
			DocuDTO nextReadDto=dao.nextReadDocu(docuNum, searchKey, searchValue);
			
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
			req.setAttribute("dataCount", dataCount);

			forward(req, resp, "/WEB-INF/views/docu/article.jsp");
		} else if (uri.indexOf("update.sst") != -1) {
			//���� ��
			int docuNum = Integer.parseInt(req.getParameter("docuNum"));
			String page=req.getParameter("page");
			
			DocuDTO dto = dao.readDocu(docuNum);
			if(dto==null || ! dto.getMemId().equals(info.getMemId())) {
				resp.sendRedirect(cp+"/docu/list.sst?page=" +page);
				return;
			}
		    
			req.setAttribute("dto", dto);
			req.setAttribute("mode", "update");
			req.setAttribute("page", page);
			forward(req, resp, "/WEB-INF/views/docu/created.jsp");
		} else if (uri.indexOf("update_ok.sst") != -1) {
			String page=req.getParameter("page");
			
			DocuDTO dto = new DocuDTO();
			dto.setDocuNum(Integer.parseInt(req.getParameter("docuNum")));
			dto.setDocuSubject(req.getParameter("docuSubject"));
			dto.setDocuContent(req.getParameter("docuContent"));

			dao.DocuUpdate(dto);
			
			resp.sendRedirect(cp + "/docu/article.sst?page="+page+ "&docuNum="+dto.getDocuNum());
		} else if (uri.indexOf("delete.sst")!=-1) {
			String page=req.getParameter("page");
			int docuNum= Integer.parseInt(req.getParameter("docuNum"));
			
			DocuDTO dto=dao.readDocu(docuNum);
			if(dto==null || (!dto.getMemId().equals(info.getMemId())
					&& !info.getMemId().equals("admin"))) {
				resp.sendRedirect(cp +"/docu/list.sst?page=" +page);
				return;
			}
			
			dao.deleteDocu(docuNum);
			resp.sendRedirect(cp +"/docu/list.sst?page=" +page);
		} else if (uri.indexOf("listReply.sst")!=-1) {
			// ���� ����Ʈ ---------------------------------------
			int docuNum= Integer.parseInt(req.getParameter("docuNum"));
			String pageNo= req.getParameter("pageNo");// ����� ��������ȣ
			int current_page = 1;
			if (pageNo != null)
				current_page = Integer.parseInt(pageNo);
			
			int numPerPage = 5;
			int total_page = 0;
			int dataCount = 0;
			
			dataCount= dao.dataCountDocuReply(docuNum);
			total_page = util.pageCount(numPerPage, dataCount);
			if (current_page > total_page)
				current_page = total_page;
			
			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;
			
			// ����Ʈ�� ����� ��� ������
			List<DocuReplyDTO> list= dao.listDocuReply(docuNum, start, end);
			
			// ���͸� <br>
			Iterator<DocuReplyDTO> it= list.iterator();
			while(it.hasNext()) {
				DocuReplyDTO dto=it.next();
				dto.setDocuR_content(dto.getDocuR_content().replaceAll("\n", "<br>"));
			}
			
			// ����¡ó��(�μ�2�� ¥�� js�� ó��)
			String paging = util.paging(current_page, total_page);
			
			req.setAttribute("list", list);
			req.setAttribute("pageNo", current_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("total_page", total_page);
			req.setAttribute("paging", paging);
			
			// ������
			String path = "/WEB-INF/views/docu/listReply.jsp";
			forward(req, resp, path);
		} else if(uri.indexOf("insertReply.sst") != -1){
			//���� �����ϱ� ------
			String state="true";
			if(info == null){ //�α��� ���� ���� ���
				state="loginFail";
			}else {
				int docuNum = Integer.parseInt(req.getParameter("docuNum"));
				DocuReplyDTO dto= new DocuReplyDTO();
				dto.setDocuNum(docuNum);
				dto.setMemId(info.getMemId());
				dto.setDocuR_content(req.getParameter("docuR_content"));
				
				int result=dao.insertDocuReply(dto);
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
			int docuR_num = Integer.parseInt(req.getParameter("docuR_num"));
			String memId=req.getParameter("memId");
			
			String state="false";
			if(info == null){ //�α��� ���� ���� ���
				state= "loginFail";				
			} else if(info.getMemId().equals("admin") || info.getMemId().equals(memId)){
				dao.deleteDocuReply(docuR_num);
				state="true";
				
			}
			StringBuffer sb=new StringBuffer();
			sb.append("{");
			sb.append("\"state\":"+"\""+state+"\"");
			sb.append("}");

			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.println(sb.toString());
		} else if(uri.indexOf("recomm.sst")!=-1) {
			int docuNum= Integer.parseInt(req.getParameter("docuNum"));
			String page= req.getParameter("page");
			
			int dataCount= dao.dataCount(docuNum, info.getMemId());
			
			if (dataCount==0)
				dao.DocuRecomm(docuNum, info.getMemId());
			
			resp.sendRedirect(cp + "/docu/article.sst?page="+page+"&docuNum="+docuNum);
		}
 
		
		
		
		
		
		
		
		
		
		
	}

}
