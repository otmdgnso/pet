package com.portfolio;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.FileManager;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/portfolio/*")
public class portfolioServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();

		String cp = req.getContextPath();

		// �̹����� ������ ���(pathname)
		String root=getServletContext().getRealPath("/");
		String pathname = root+File.separator + "uploads" + File.separator + "portfolio";
		File f = new File(pathname);
		if (!f.exists()) { // ������ �������� ������
			f.mkdirs();
		}
		PortfolioDAO dao = new PortfolioDAO();
		MyUtil util = new MyUtil();

		// uri�� ���� �۾� ����
		if (uri.indexOf("list.sst") != -1) {
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
				dto.setMemId(mreq.getParameter("MemId"));

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
		}else if(uri.indexOf("article.sst")!=-1) {
			int num=Integer.parseInt(req.getParameter("num"));
			String page=req.getParameter("page");
			
			PortfolioDTO dto=dao.readPortfolio(num);
			if(dto==null) {
				resp.sendRedirect(cp+"/portfolio/list.sst?page="+page);
				return;
			}
			
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			
			String path="/WEB-INF/views/portfolio/article.jsp";
			forward(req, resp, path);
			
		} 

	}
}
