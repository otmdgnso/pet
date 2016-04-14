package com.company;

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

@WebServlet("/company/*")
public class CompanyServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		
		CompanyDAO dao = new CompanyDAO();
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
				searchKey = "companySubject";
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
 			List<CompanyDTO> list;
			if(searchValue.length()==0)
				list=dao.listCompany(start, end);
			else
				list=dao.listCompany(start, end, searchKey, searchValue);

			
			//��õ��
			List<CompanyDTO> listBestCompany=null;
			listBestCompany=dao.listBestCompany();
			
			
			
			// ����Ʈ �۹�ȣ
			int listCompanyNum, n = 0;
			Iterator<CompanyDTO> it = list.iterator();
			while (it.hasNext()) {
				CompanyDTO dto = it.next();
				listCompanyNum = dataCount - (start + n - 1);
				dto.setListCompanyNum(listCompanyNum);
				n++;
			}

			String params = "";
			if(searchValue.length()!=0) {
				params="searchKey=" +searchKey+ "&searchValue="
						+ URLEncoder.encode(searchValue, "UTF-8");
			}
			//����¡ ó��
			String listUrl = cp + "/company/list.sst";
			String articleUrl = cp + "/company/article.sst?page=" + current_page;
			if (params.length() != 0) {
				listUrl += "?" + params;
				articleUrl += "&" + params;
			}
			String paging = util.paging(current_page, total_page, listUrl);
            //�������� JSP�� �ѱ� �Ӽ�
			req.setAttribute("list", list);
			req.setAttribute("listBestCompany", listBestCompany);
			req.setAttribute("paging", paging);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("articleUrl", articleUrl);

			forward(req, resp, "/WEB-INF/views/company/list.jsp");
		} else if(uri.indexOf("created.sst")!=-1) {
			
			// �۾�����
			if(info == null){ //�α��� ���� ������� ,������������ �Ѿ
				
				resp.sendRedirect(cp+"/");
				return;
			}
			req.setAttribute("mode", "created");
			forward(req, resp, "/WEB-INF/views/company/created.jsp");
		} else if(uri.indexOf("created_ok.sst")!=-1) {
			// �Խù� ����
			if(info == null){
			    
				resp.sendRedirect(cp+"/"); //�α��� ���� ������� �����������γѾ
				return;
			}
			
			CompanyDTO dto= new CompanyDTO();
			
			// userId�� ���ǿ� ����� ����
			dto.setMemId(info.getMemId());
			
			//�Ķ����
			dto.setCompanyContent(req.getParameter("companyContent"));
			dto.setCompanySubject(req.getParameter("companySubject"));
			
			dao.insertCompany(dto);
			
			req.setAttribute("mode", "created");
			resp.sendRedirect(cp+ "/company/list.sst");
		} else if (uri.indexOf("article.sst") != -1) {
			//�ۺ���
	        if(info == null){
			    
				resp.sendRedirect(cp+"/"); //�α��� ���� ������� �����������γѾ
				return;
			}
			
	        //�Ķ���� : CompanyNum, page,[searchKey,searchValue]
			int companyNum = Integer.parseInt(req.getParameter("companyNum"));
			int recommCount=dao.recommCount(companyNum, info.getMemId());
			String page = req.getParameter("page");
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			if(searchKey==null) {
				searchKey="companySubject";
				searchValue="";
			}
			searchValue=URLDecoder.decode(searchValue,"UTF-8");
            //��ȸ�� ����
			dao.companyHitCount(companyNum);
           //�Խù� ��������
			CompanyDTO dto = dao.readCompany(companyNum);

			if (dto == null) { //�Խù� ������ �ٽ� ����Ʈ�� ��
				resp.sendRedirect(cp + "/company/list.sst?page=" + page);
				return;
			}

			int linesu = dto.getCompanyContent().split("\n").length;
			dto.setCompanyContent(dto.getCompanyContent().replaceAll("\n", "<br>"));
			
			//������ ������
			CompanyDTO preReadDto=dao.preReadCompany(companyNum, searchKey, searchValue);
			CompanyDTO nextReadDto=dao.nextReadCompany(companyNum, searchKey, searchValue);
			
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
			req.setAttribute("recommCount", recommCount);

			forward(req, resp, "/WEB-INF/views/company/article.jsp");
		} else if (uri.indexOf("update.sst") != -1) {
			//���� ��
			int companyNum = Integer.parseInt(req.getParameter("companyNum"));
			String page=req.getParameter("page");
			
			CompanyDTO dto = dao.readCompany(companyNum);
			if(dto==null || ! dto.getMemId().equals(info.getMemId())) {
				resp.sendRedirect(cp+"/company/list.sst?page=" +page);
				return;
			}
		    
			req.setAttribute("dto", dto);
			req.setAttribute("mode", "update");
			req.setAttribute("page", page);
			forward(req, resp, "/WEB-INF/views/company/created.jsp");
		} else if (uri.indexOf("update_ok.sst") != -1) {
			String page=req.getParameter("page");
			
			CompanyDTO dto = new CompanyDTO();
			dto.setCompanyNum(Integer.parseInt(req.getParameter("companyNum")));
			dto.setCompanySubject(req.getParameter("companySubject"));
			dto.setCompanyDate(req.getParameter("companyDate"));
			dto.setCompanyContent(req.getParameter("companyContent"));
			dto.setCompanyName(req.getParameter("companyName"));
			dto.setCompanySales(req.getParameter("companySales"));
			dto.setCompanyForm(req.getParameter("companyForm"));
			dto.setCompanyIndustry(req.getParameter("companyIndustry"));
			dto.setCompanyPlanet(req.getParameter("companyPlanet"));
			dto.setCompanyWeb(req.getParameter("companyWeb"));
			dto.setCompanySalary(req.getParameter("companySalary"));
			dto.setCompanyScore(req.getParameter("companyScore"));
		
			dao.companyUpdate(dto);
			
			resp.sendRedirect(cp + "/company/article.sst?page="+page+ "&companyNum="+dto.getCompanyNum());
		} else if (uri.indexOf("delete.sst")!=-1) {
			String page=req.getParameter("page");
			int companyNum= Integer.parseInt(req.getParameter("companyNum"));
			
			CompanyDTO dto=dao.readCompany(companyNum);
			if(dto==null || (!dto.getMemId().equals(info.getMemId())
					&& !info.getMemId().equals("admin"))) {
				resp.sendRedirect(cp +"/company/list.sst?page=" +page);
				return;
			}
			
			dao.deleteCompany(companyNum);
			resp.sendRedirect(cp +"/company/list.sst?page=" +page);
		} else if (uri.indexOf("listReply.sst")!=-1) {
			// ���� ����Ʈ ---------------------------------------
			int companyNum= Integer.parseInt(req.getParameter("companyNum"));
			String pageNo= req.getParameter("pageNo");// ����� ��������ȣ
			int current_page = 1;
			if (pageNo != null)
				current_page = Integer.parseInt(pageNo);
			
			int numPerPage = 5;
			int total_page = 0;
			int dataCount = 0;
			
			dataCount= dao.dataCountCompanyReply(companyNum);
			total_page = util.pageCount(numPerPage, dataCount);
			if (current_page > total_page)
				current_page = total_page;
			
			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;
			
			// ����Ʈ�� ����� ��� ������
			List<CompanyReplyDTO> list= dao.listCompanyReply(companyNum, start, end);
			
			// ���͸� <br>
			Iterator<CompanyReplyDTO> it= list.iterator();
			while(it.hasNext()) {
				CompanyReplyDTO dto=it.next();
				dto.setCompanyR_content(dto.getCompanyR_content().replaceAll("\n", "<br>"));
			}
			
			// ����¡ó��(�μ�2�� ¥�� js�� ó��)
			String paging = util.paging(current_page, total_page);
			
			req.setAttribute("list", list);
			req.setAttribute("pageNo", current_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("total_page", total_page);
			req.setAttribute("paging", paging);
			
			// ������
			String path = "/WEB-INF/views/company/listReply.jsp";
			forward(req, resp, path);
		} else if(uri.indexOf("insertReply.sst") != -1){
			//���� �����ϱ� ------
			String state="true";
			if(info == null){ //�α��� ���� ���� ���
				state="loginFail";
			}else {
				int companyNum = Integer.parseInt(req.getParameter("companyNum"));
				CompanyReplyDTO dto= new CompanyReplyDTO();
				dto.setCompanyNum(companyNum);
				dto.setMemId(info.getMemId());
				dto.setCompanyR_content(req.getParameter("companyR_content"));
				
				int result=dao.insertCompanyReply(dto);
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
			int companyR_num = Integer.parseInt(req.getParameter("companyR_num"));
			String memId=req.getParameter("memId");
			
			String state="false";
			if(info == null){ //�α��� ���� ���� ���
				state= "loginFail";				
			} else if(info.getMemId().equals("admin") || info.getMemId().equals(memId)){
				dao.deleteCompanyReply(companyR_num);
				state="true";
				
			}
			StringBuffer sb=new StringBuffer();
			sb.append("{");
			sb.append("\"state\":"+"\""+state+"\"");
			sb.append("}");

			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.println(sb.toString());
		}else if(uri.indexOf("recomm.sst")!=-1) {  
	          //////// ��õ�� ����
	         int companyNum= Integer.parseInt(req.getParameter("companyNum"));
	         String page= req.getParameter("page");
	         
	         int recommCount= dao.recommCount(companyNum, info.getMemId());
	         
	         if (recommCount==0)
	            dao.CompanyRecomm(companyNum, info.getMemId());
	         
	         resp.sendRedirect(cp + "/company/article.sst?page="+page+"&companyNum="+companyNum);
		
	}
 
		
		
		
		
		
		
		
		
		
		
	}

}
