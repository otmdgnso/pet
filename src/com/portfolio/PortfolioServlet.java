package com.portfolio;

import java.io.File;
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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.FileManager;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/portfolio/*")
public class PortfolioServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();

		String cp = req.getContextPath();
		// �α��� ������ ���ǿ��� ��������
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		// �̹����� ������ ���(pathname)
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "portfolio";
		File f = new File(pathname);
		if (!f.exists()) { // ������ �������� ������
			f.mkdirs();
		}
		PortfolioDAO dao = new PortfolioDAO();
		MyUtil util = new MyUtil();

		// uri�� ���� �۾� ����
		if (uri.indexOf("list.sst") != -1) {
			
			if(info==null) { // �α��ε��� ���� ���
				
				String msg2=" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �α��� �� ����Ͻ� �� �ֽ��ϴ�";
				req.setAttribute("message", msg2);
				
				String path="/WEB-INF/views/member/login.jsp";
				forward(req, resp, path);
				return ;
			}
			
			// �Խù� ����Ʈ
			String page = req.getParameter("page");
			int current_page = 1;
			if (page != null)
				current_page = Integer.parseInt(page);

			// ��ü������ ����
			int dataCount = dao.dataCount();

			// ��ü��������
			int numPerPage = 6;
			int total_page = util.pageCount(numPerPage, dataCount);
			if (current_page > total_page)
				current_page = total_page;

			// �Խù� ������ ���۰� ����ġ
			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;

			// �Խù� ��������
			List<PortfolioDTO> list = dao.listPortfolio(start, end);

			// ����¡ ó��
			String listUrl = cp + "/portfolio/list.sst";
			String articleUrl = cp + "/portfolio/article.sst?page=" + current_page;
			String paging = util.paging(current_page, total_page, listUrl);

			// �������� list.jsp�� �ѱ� ��
			req.setAttribute("list", list);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("paging", paging);

			String path = "/WEB-INF/views/portfolio/list.jsp";
			forward(req, resp, path);

		} else if (uri.indexOf("created.sst") != -1) {
			// �۾��� ��
			req.setAttribute("mode", "created");
			String path = "/WEB-INF/views/portfolio/created.jsp";
			forward(req, resp, path);
		} else if (uri.indexOf("created_ok.sst") != -1) {
			// �Խù� ����
			// <form enctype="multipart/form-data"....
			// �̾�� ������ ���ε� �����ϰ� request�� �̿��Ͽ�
			// �Ķ���͸� �Ѱ� ���� �� ����.
			String encType = "utf-8";
			int maxSize = 5 * 1024 * 1024;

			MultipartRequest mreq = new MultipartRequest(req, pathname, maxSize, encType,
					new DefaultFileRenamePolicy());

			PortfolioDTO dto = new PortfolioDTO();

			// �̹��� ������ ���ε� �Ѱ��
			if (mreq.getFile("upload") != null) {
				dto.setMemId(info.getMemId());

				dto.setSubject(mreq.getParameter("subject"));
				dto.setContent(mreq.getParameter("content"));

				// ������ ����� ���ϸ�
				String saveFilename = mreq.getFilesystemName("upload");

				// �����̸�����
				saveFilename = FileManager.doFilerename(pathname, saveFilename);

				dto.setImageFilename(saveFilename);

				// ����
				dao.insertPortfolio(dto);
			}
			resp.sendRedirect(cp + "/portfolio/list.sst");

		} else if (uri.indexOf("article.sst") != -1) {
			int num = Integer.parseInt(req.getParameter("num"));
			String page = req.getParameter("page");

			dao.updateHitCount(num);

			PortfolioDTO dto = dao.readPortfolio(num);
			if (dto == null) {
				resp.sendRedirect(cp + "/portfolio/list.sst?page=" + page);
				return;
			}

			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

			req.setAttribute("dto", dto);
			req.setAttribute("page", page);

			String path = "/WEB-INF/views/portfolio/article.jsp";
			forward(req, resp, path);

		} else if (uri.indexOf("update.sst") != -1) {
			String page = req.getParameter("page");
			int num = Integer.parseInt(req.getParameter("num"));
			PortfolioDTO dto = dao.readPortfolio(num);

			if (dto == null) {
				resp.sendRedirect(cp + "/portfolio/list.sst?page=" + page);
				return;
			}

			if (!dto.getMemId().equals(info.getMemId())) {
				resp.sendRedirect(cp + "/portfolio/list.sst?page=" + page);
				return;
			}

			req.setAttribute("dto", dto);
			req.setAttribute("page", page);

			req.setAttribute("mode", "update");
			String path = "/WEB-INF/views/portfolio/created.jsp";
			forward(req, resp, path);

		} else if (uri.indexOf("update_ok.sst") != -1) {
			// ���� �Ϸ�
			String encType = "utf-8";
			int maxSize = 5 * 1024 * 1024;

			MultipartRequest mreq = new MultipartRequest(req, pathname, maxSize, encType,
					new DefaultFileRenamePolicy());

			String page = mreq.getParameter("page");
			String imageFilename = mreq.getParameter("imageFilename");

			PortfolioDTO dto = new PortfolioDTO();
			int num=Integer.parseInt(mreq.getParameter("num"));
			dto.setNum(num);
			dto.setSubject(mreq.getParameter("subject"));
			dto.setContent(mreq.getParameter("content"));

			// �̹��� ������ ���ε� �Ѱ��
			if (mreq.getFile("upload") != null) {
				// ���� �̹��� ���� �����
				FileManager.doFiledelete(pathname, imageFilename);

				// ������ ����� ���ϸ�
				String saveFilename = mreq.getFilesystemName("upload");

				// ���� �̸� ����
				saveFilename = FileManager.doFilerename(pathname, saveFilename);

				dto.setImageFilename(saveFilename);
			} else {
				// ���ο� �̹��� ������ �ø��� ���� ��� ���� �̹��� ���Ϸ�
				dto.setImageFilename(imageFilename);
			}

			dao.updatePortfolio(dto);

			resp.sendRedirect(cp + "/portfolio/article.sst?page=" + page+"&num="+num);
			
			

		} else if (uri.indexOf("delete.sst") != -1) {
			// ���� �Ϸ�
			int num = Integer.parseInt(req.getParameter("num"));
			String page = req.getParameter("page");

			PortfolioDTO dto = dao.readPortfolio(num);
			if (dto == null) {
				resp.sendRedirect(cp + "/portfolio/list.sst?page=" + page);
				return;
			}

			// �Խù��� �ø� ����ڳ� admin�� �ƴϸ�
			if (!dto.getMemId().equals(info.getMemId()) && !info.getMemId().equals("admin")) {
				resp.sendRedirect(cp + "/portfolio/list.sst?page=" + page);
				return;
			}

			// �̹��� ���� �����
			FileManager.doFiledelete(pathname, dto.getImageFilename());

			// ���̺� ������ ����
			dao.deletePortfolio(num);

			resp.sendRedirect(cp + "/portfolio/list.sst?page=" + page);
		}else if (uri.indexOf("listReply.sst") != -1) {
			// ���� ����Ʈ ---------------------------------------
			int num = Integer.parseInt(req.getParameter("num"));
			String pageNo = req.getParameter("pageNo");
			int current_page = 1;
			if (pageNo != null)
				current_page = Integer.parseInt(pageNo);

			int numPerPage = 5;
			int total_page = 0;
			int dataCount = 0;

			dataCount = dao.dataCountReply(num);
			total_page = util.pageCount(numPerPage, dataCount);
			if (current_page > total_page)
				current_page = total_page;

			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;

			// ����Ʈ�� ����� ������
			List<PortfolioReplyDTO> list = dao.listReply(num, start, end);

			// ���͸� <br>
			Iterator<PortfolioReplyDTO> it = list.iterator();
			while (it.hasNext()) {
				PortfolioReplyDTO dto = it.next();
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}

			// ����¡ó��(�μ�2�� ¥�� js�� ó��)
			String paging = util.paging(current_page, total_page);

			req.setAttribute("list", list);
			req.setAttribute("pageNo", current_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("total_page", total_page);
			req.setAttribute("paging", paging);

			// ������
			String path = "/WEB-INF/views/portfolio/portfolioReply.jsp";
			forward(req, resp, path);
		} else if (uri.indexOf("insertReply.sst") != -1) {
			// ���� �����ϱ� ---------------------------------------
			String state="true";
			if (info == null) { // �α��ε��� ���� ���
				state="loginFail";
			} else {
				int num = Integer.parseInt(req.getParameter("num"));
				PortfolioReplyDTO rdto = new PortfolioReplyDTO();
				rdto.setNum(num);
				rdto.setMemId(info.getMemId());
				rdto.setContent(req.getParameter("content"));

				int result=dao.insertReply(rdto);
				if(result==0)
					state="false";
			}

			StringBuffer sb=new StringBuffer();
			sb.append("{");
			sb.append("\"state\":"+"\""+state+"\"");
			sb.append("}");
			
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.println(sb.toString());
		} else if (uri.indexOf("deleteReply.sst") != -1) {
			// ���� ���� ---------------------------------------
			int replyNum = Integer.parseInt(req.getParameter("replyNum"));
			String memId=req.getParameter("memId");
			
			String state="false";
			if (info == null) { // �α��ε��� ���� ���
				state="loginFail";
			} else if(info.getMemId().equals("admin") || info.getMemId().equals(memId)) {
				dao.deleteReply(replyNum);
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
