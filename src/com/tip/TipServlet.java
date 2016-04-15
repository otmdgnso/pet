package com.tip;

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

import com.company.CompanyDTO;
import com.member.SessionInfo;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/tip/*")
public class TipServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		
		TipDAO dao = new TipDAO();
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
				searchKey = "tipSubject";
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
 			List<TipDTO> list;
			if(searchValue.length()==0)
				list=dao.listTip(start, end);
			else
				list=dao.listTip(start, end, searchKey, searchValue);

			//��õ��
			List<TipDTO> listBestTip=null;
			listBestTip=dao.listBestTip();
			
			
			// ����Ʈ �۹�ȣ
			int listTipNum, n = 0;
			Iterator<TipDTO> it = list.iterator();
			while (it.hasNext()) {
				TipDTO dto = it.next();
				listTipNum = dataCount - (start + n - 1);
				dto.setListTipNum(listTipNum);
				n++;
			}

			String params = "";
			if(searchValue.length()!=0) {
				params="searchKey=" +searchKey+ "&searchValue="
						+ URLEncoder.encode(searchValue, "UTF-8");
			}
			//����¡ ó��
			String listUrl = cp + "/tip/list.sst";
			String articleUrl = cp + "/tip/article.sst?page=" + current_page;
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
			req.setAttribute("listBestTip", listBestTip);

			forward(req, resp, "/WEB-INF/views/tip/list.jsp");
		} else if(uri.indexOf("created.sst")!=-1) {
			
			// �۾�����
			if(info == null){ //�α��� ���� ������� ,������������ �Ѿ
				
				resp.sendRedirect(cp+"/");
				return;
			}
			req.setAttribute("mode", "created");
			forward(req, resp, "/WEB-INF/views/tip/created.jsp");
		} else if(uri.indexOf("created_ok.sst")!=-1) {
			// �Խù� ����
			if(info == null){
			    
				resp.sendRedirect(cp+"/"); //�α��� ���� ������� �����������γѾ
				return;
			}
			
			TipDTO dto= new TipDTO();
			
			// userId�� ���ǿ� ����� ����
			dto.setMemId(info.getMemId());
			
			
			//�Ķ����
			dto.setTipSubject(req.getParameter("tipSubject"));
			dto.setTipHead(req.getParameter("tipHead"));
			dto.setTipContent(req.getParameter("tipContent"));
			dto.setTipSource(req.getParameter("tipSource"));
			
			dao.insertTip(dto);
			
			req.setAttribute("mode", "created");
			resp.sendRedirect(cp+ "/tip/list.sst");
		} else if (uri.indexOf("article.sst") != -1) {
			  if(info==null) { // �α��ε��� ���� ���
					
					String msg2=" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �α��� �� ����Ͻ� �� �ֽ��ϴ�";
					req.setAttribute("message", msg2);
					
					String path="/WEB-INF/views/member/login.jsp";
					forward(req, resp, path);
					return ;
				}
			  
	        //�Ķ���� : TipNum, page,[searchKey,searchValue]
			int tipNum = Integer.parseInt(req.getParameter("tipNum"));
			int recommCount=dao.recommCount(tipNum, info.getMemId());
			String page = req.getParameter("page");
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			if(searchKey==null) {
				searchKey="tipSubject";
				searchValue="";
			}
			searchValue=URLDecoder.decode(searchValue,"UTF-8");
            //��ȸ�� ����
			dao.tipHitCount(tipNum);
           //�Խù� ��������
			TipDTO dto = dao.readTip(tipNum);

			if (dto == null) { //�Խù� ������ �ٽ� ����Ʈ�� ��
				resp.sendRedirect(cp + "/tip/list.sst?page=" + page);
				return;
			}

			int linesu = dto.getTipContent().split("\n").length;
			dto.setTipContent(dto.getTipContent().replaceAll("\n", "<br>"));
			
			//������ ������
			TipDTO preReadDto=dao.preReadTip(tipNum, searchKey, searchValue);
			TipDTO nextReadDto=dao.nextReadTip(tipNum, searchKey, searchValue);
			
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

			forward(req, resp, "/WEB-INF/views/tip/article.jsp");
		} else if (uri.indexOf("update.sst") != -1) {
			//���� ��
			int tipNum = Integer.parseInt(req.getParameter("tipNum"));
			String page=req.getParameter("page");
			
			TipDTO dto = dao.readTip(tipNum);
			if(dto==null || ! dto.getMemId().equals(info.getMemId())) {
				resp.sendRedirect(cp+"/tip/list.sst?page=" +page);
				return;
			}
		    
			req.setAttribute("dto", dto);
			req.setAttribute("mode", "update");
			req.setAttribute("page", page);
			forward(req, resp, "/WEB-INF/views/tip/created.jsp");
		} else if (uri.indexOf("update_ok.sst") != -1) {
			String page=req.getParameter("page");
			
			TipDTO dto = new TipDTO();
			dto.setTipNum(Integer.parseInt(req.getParameter("tipNum")));
			dto.setTipSubject(req.getParameter("tipSubject"));
			dto.setTipHead(req.getParameter("tipHead"));
			dto.setTipContent(req.getParameter("tipContent"));
			dto.setTipSource(req.getParameter("tipSource"));

			dao.tipUpdate(dto);
			
			resp.sendRedirect(cp + "/tip/article.sst?page="+page+ "&tipNum="+dto.getTipNum());
		} else if (uri.indexOf("delete.sst")!=-1) {
			String page=req.getParameter("page");
			int tipNum= Integer.parseInt(req.getParameter("tipNum"));
			
			TipDTO dto=dao.readTip(tipNum);
			if(dto==null || (!dto.getMemId().equals(info.getMemId())
					&& !info.getMemId().equals("admin"))) {
				resp.sendRedirect(cp +"/tip/list.sst?page=" +page);
				return;
			}
			
			dao.deleteTip(tipNum);
			resp.sendRedirect(cp +"/tip/list.sst?page=" +page);
		} else if (uri.indexOf("listReply.sst")!=-1) {
			// ���� ����Ʈ ---------------------------------------
			int tipNum= Integer.parseInt(req.getParameter("tipNum"));
			String pageNo= req.getParameter("pageNo");// ����� ��������ȣ
			int current_page = 1;
			if (pageNo != null)
				current_page = Integer.parseInt(pageNo);
			
			int numPerPage = 5;
			int total_page = 0;
			int dataCount = 0;
			
			dataCount= dao.dataCountTipReply(tipNum);
			total_page = util.pageCount(numPerPage, dataCount);
			if (current_page > total_page)
				current_page = total_page;
			
			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;
			
			// ����Ʈ�� ����� ��� ������
			List<TipReplyDTO> list= dao.listTipReply(tipNum, start, end);
			
			// ���͸� <br>
			Iterator<TipReplyDTO> it= list.iterator();
			while(it.hasNext()) {
				TipReplyDTO dto=it.next();
				dto.setTipR_content(dto.getTipR_content().replaceAll("\n", "<br>"));
			}
			
			// ����¡ó��(�μ�2�� ¥�� js�� ó��)
			String paging = util.paging(current_page, total_page);
			
			req.setAttribute("list", list);
			req.setAttribute("pageNo", current_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("total_page", total_page);
			req.setAttribute("paging", paging);
			
			// ������
			String path = "/WEB-INF/views/tip/listReply.jsp";
			forward(req, resp, path);
		} else if(uri.indexOf("insertReply.sst") != -1){
			//���� �����ϱ� ------
			String state="true";
			if(info == null){ //�α��� ���� ���� ���
				state="loginFail";
			}else {
				int tipNum = Integer.parseInt(req.getParameter("tipNum"));
				TipReplyDTO dto= new TipReplyDTO();
				dto.setTipNum(tipNum);
				dto.setMemId(info.getMemId());
				dto.setTipR_content(req.getParameter("tipR_content"));
				
				int result=dao.insertTipReply(dto);
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
			int tipR_num = Integer.parseInt(req.getParameter("tipR_num"));
			String memId=req.getParameter("memId");
			
			String state="false";
			if(info == null){ //�α��� ���� ���� ���
				state= "loginFail";				
			} else if(info.getMemId().equals("admin") || info.getMemId().equals(memId)){
				dao.deleteTipReply(tipR_num);
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
	         int tipNum= Integer.parseInt(req.getParameter("tipNum"));
	         String page= req.getParameter("page");
	         
	         int recommCount= dao.recommCount(tipNum, info.getMemId());
	         
	         if (recommCount==0)
	            dao.TipRecomm(tipNum, info.getMemId());
	         
	         resp.sendRedirect(cp + "/tip/article.sst?page="+page+"&tipNum="+tipNum);
		
	}
		
		
	}

}
