package com.share;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		if (uri.indexOf("list.sst") != -1) {
			String page = req.getParameter("page");
			int current_page = 1;
			if (page != null)
				current_page = Integer.parseInt(page);

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

			// ������ ���� ���ϱ�
			int dataCount;
			if (searchValue.length()==0)
				dataCount=dao.dataCount();
			else
				dataCount=dao.dataCount(searchKey, searchValue);

			int numPerPage = 10;
			int total_page = util.pageCount(numPerPage, dataCount);
			if (current_page > total_page)
				current_page = total_page;

			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;

			List<ShareDTO> list;
			if(searchValue.length()==0)
				list=dao.listShare(start, end);
			else
				list=dao.listShare(start, end, searchKey, searchValue);

			// ����Ʈ �۹�ȣ
			int shareNum, n = 0;
			Iterator<ShareDTO> it = list.iterator();
			while (it.hasNext()) {
				ShareDTO dto = it.next();
				shareNum = dataCount - (start + n - 1);
				dto.setShareNum(shareNum);
				n++;
			}

			String params = "";
			if(searchValue.length()!=0) {
				params="searchKey=" +searchKey+ "&searchValue="
						+ URLEncoder.encode(searchValue, "UTF-8");
			}
			
			String listUrl = cp + "/bbs/list.sst";
			String articleUrl = cp + "/bbs/article.sst?page=" + current_page;
			if (params.length() != 0) {
				listUrl += "?" + params;
				articleUrl += "&" + params;
			}
			String paging = util.paging(current_page, total_page, listUrl);

			req.setAttribute("list", list);
			req.setAttribute("paging", paging);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("articleUrl", articleUrl);

			forward(req, resp, "/WEB-INF/views/bbs/list.jsp");
		} else if (uri.indexOf("article.sst") != -1) {
			int shareNum = Integer.parseInt(req.getParameter("shareNum"));
			String page = req.getParameter("page");
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			if(searchKey==null) {
				searchKey="shareSubject";
				searchValue="";
			}
			searchValue=URLDecoder.decode(searchValue,"UTF-8");

			dao.ShareHitCount(shareNum);

			ShareDTO dto = dao.readShare(shareNum);

			if (dto == null) {
				resp.sendRedirect(cp + "/bbs/list.sst?page=" + page);
				return;
			}

			int linesu = dto.getShareContent().split("\n").length;
			dto.setShareContent(dto.getShareContent().replaceAll("\n", "<br>"));

			String params = "page=" + page;
			if(searchValue.length()!=0) {
				params+="&searchKey=" +searchKey+ "&searchValue=" 
						+URLEncoder.encode(searchValue,"UTF-8");
			}

			// JSP�� ������ �Ӽ�
			req.setAttribute("dto", dto);
			req.setAttribute("params", params);
			req.setAttribute("linesu", linesu);
			req.setAttribute("page", page);

			forward(req, resp, "/WEB-INF/views/bbs/article.jsp");
		} else if (uri.indexOf("update.sst") != -1) {
			int shareNum = Integer.parseInt(req.getParameter("shareNum"));

			ShareDTO dto = dao.readShare(shareNum);
			req.setAttribute("dto", dto);
			req.setAttribute("mode", "update");
			forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
		} else if (uri.indexOf("update_ok.sst") != -1) {
			ShareDTO dto = new ShareDTO();
			dto.setShareNum(Integer.parseInt(req.getParameter("shareNum")));
			dto.setShareSubject(req.getParameter("shareSubject"));
			dto.setShareContent(req.getParameter("shareContent"));

			dao.ShareUpdate(dto);
			resp.sendRedirect(cp + "/bbs/article.sst?shareNum=" + dto.getShareNum());
		}

	}

}
