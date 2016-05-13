package com.pet.common;

import org.springframework.stereotype.Service;

@Service("myUtil")
public class MyUtil {
	//�c������ �� ���ϱ�
	public int pageCount(int numPerPage, int dataCount) {
		int pageCount=0;
		
		if(dataCount > 0) {
			if(dataCount % numPerPage==0) 
				pageCount=dataCount/numPerPage;
			else
				pageCount=dataCount/numPerPage+1;
		}
		
		return pageCount;
	}
	
	//����¡(paging) ó��(GET ���)
	public String paging(int current_page, int total_page, String list_url) {
		StringBuffer sb=new StringBuffer();
		
		int numPerBlock=10;
		int currentPageSetup;
		int n, page;
		
		if(current_page<1 || total_page < 1)
			return "";
		
		if(list_url.indexOf("?")!=-1)
			list_url+="&";
		else
			list_url+="?";
		
		//currentPageSetup : ǥ���� ù������ -1
		currentPageSetup=(current_page/numPerBlock)*numPerBlock;
		if(current_page%numPerBlock==0)
			currentPageSetup=currentPageSetup-numPerBlock;
		
		sb.append("<style type='text/css'>");
		sb.append("#paginate {clear:both;font:12px ����,Dotum,����,Gulim,AppleGothic;padding:15px 0px 0px 0px;text-align:center;height:28px;white-space:nowrap;}");
		sb.append("#paginate a {border:1px solid #ccc;height:28px;color:#000000;text-decoration:none;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;outline:none; select-dummy: expression(this.hideFocus=true);}");
		sb.append("#paginate a:hover, a:active {border:1px solid #ccc;color:#6771ff;vertical-align:middle; line-height:normal;}");
		sb.append("#paginate .curBox {border:1px solid #e28d8d; background: #fff; color:#cb3536; font-weight:bold;height:28px;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;}");
		sb.append("#paginate .numBox {border:1px solid #ccc;height:28px;font-weight:bold;text-decoration:none;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;}");
		sb.append("</style>");
		
		sb.append("<div id='paginate'>");
		//ó��������, ����(10������ ��)
		n=current_page-numPerBlock;
		if(total_page>numPerBlock && currentPageSetup>0) {
			sb.append("<a href='"+list_url+"page=1'>ó��</a>");
			sb.append("<a href='"+list_url+"page="+n+"'>����</a>");
		}
		
		//�ٷΰ���
		page=currentPageSetup+1;
		while(page<=total_page && page<=(currentPageSetup+numPerBlock)) {
			if(page==current_page) {
				sb.append("<span class='curBox'>"+page+"</span>");
			} else {
				sb.append("<a href='"+list_url+"page="+page+"' class='numBox'>"+page+"</a>");
			}
			page++;
		}
		
		//����(10������ ��), ������������
		n=current_page+numPerBlock;
		if(n>total_page) n=total_page;
		if(total_page-currentPageSetup>numPerBlock) {
			sb.append("<a href='"+list_url+"page="+n+"'>����</a>");
			sb.append("<a href='"+list_url+"page="+total_page+"'>��	</a>");
		}
		sb.append("</div>");
		
		return sb.toString();
	}
	
	//javascript ������ ó��(javascript listPage() �Լ� ȣ��)
	public String paging(int current_page, int total_page) {
		if(current_page<1 || total_page<1) 
			return "";
		
		int numPerBlock=10;
		int currentPageSetUp;
		int n;
		int page;
		StringBuffer sb=new StringBuffer();
		
		//ǥ���� ������
		currentPageSetUp=(current_page/numPerBlock)*numPerBlock;
		if(current_page%numPerBlock==0)
			currentPageSetUp=currentPageSetUp-numPerBlock;
		
		sb.append("<style type='text/css'>");
		sb.append("#paginate {clear:both;font:12px ����,Dotum,����,Gulim,AppleGothic;padding:15px 0px 0px 0px;text-align:center;height:28px;white-space:nowrap;}");
		sb.append("#paginate a {border:1px solid #ccc;height:28px;color:#000000;text-decoration:none;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;outline:none; select-dummy: expression(this.hideFocus=true);}");
		sb.append("#paginate a:hover, a:active {border:1px solid #ccc;color:#6771ff;vertical-align:middle; line-height:normal;}");
		sb.append("#paginate .curBox {border:1px solid #e28d8d; background: #fff; color:#cb3536; font-weight:bold;height:28px;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;}");
		sb.append("#paginate .numBox {border:1px solid #ccc;height:28px;font-weight:bold;text-decoration:none;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;}");
		sb.append("</style>");
		
		sb.append("<div id='paginate'>");
		
		//ó��������, ����(10������ ��)
		n=current_page-numPerBlock;
		if((total_page>numPerBlock) && (currentPageSetUp>0)) {
			sb.append("<a onclick='listPage(1);'>ó��</a>");
			sb.append("<a onclick='listPage("+n+");'>����</a>");
		}
		
		//�ٷΰ��� ������ ����
		page=currentPageSetUp+1;
		while((page<=total_page) && (page<=currentPageSetUp+numPerBlock)) {
			if(page==current_page) {
				sb.append("<span class='curBox'>"+page+"</span>");
			} else {
				sb.append("<a onclick='listPage("+page+");' class='numBox'>"+page+"</a>");
			}
			page++;
		}
		
		//����(10������ ��), ������ ������
		n=current_page+numPerBlock;
		if(n>total_page) n=total_page;
		if(total_page-currentPageSetUp>numPerBlock) {
			sb.append("<a onclick='listPage("+n+");'>����</a>");
			sb.append("<a onclick='listPage("+total_page+");'>��</a>");
		}
		sb.append("</div");
		
		return sb.toString();
	}
}
