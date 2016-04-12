package com.docu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class DocuDAO {
	private Connection conn = DBConn.getConnection();

	// ������ �߰�
	public int insertDocu(DocuDTO dto) {
	      int result = 0;
	      PreparedStatement pstmt = null;
	      StringBuffer sb = new StringBuffer();

	      try {
	         sb.append("INSERT INTO docu(memId, docuSubject, docuContent,docuFile,originalFilename, filesize ) ");
	         sb.append(" VALUES (?,?,?,?,?,?)");

	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setString(1, dto.getMemId());
	         pstmt.setString(2, dto.getDocuSubject());
	         pstmt.setString(3, dto.getDocuContent());
             pstmt.setString(4, dto.getDocuFile());
             pstmt.setString(5, dto.getOriginalFilename());
 			 pstmt.setLong(6, dto.getFileSize());
	         result = pstmt.executeUpdate();

	      } catch (Exception e) {
	         System.out.println(e.toString());
	      } finally {
	         if (pstmt != null)
	            try {
	               pstmt.close();
	            } catch (SQLException e) {

	            }
	      }
	      return result;
	   }


	// ������ ����
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = " SELECT IFNULL(COUNT(*), 0) FROM docu";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);

			}
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}

		return result;
	}

	// �˻������� ������ ���� (�������� ���� Ȯ������ ����.....)
	public int dataCount(String searchKey, String searchValue) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();

		try {
			sb.append("SELECT IFNULL(COUNT(*), 0) FROM docu");
			if (searchKey.equals("memId"))
				sb.append(" WHERE memId LIKE CONCAT('%', ?, '%')");
			else if (searchKey.equals("docuCreated"))
				sb.append(" WHERE docuCreated=? ");
			else
				sb.append(" WHERE " + searchKey + " LIKE CONCAT('%', ? ,'%' )");

			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, searchValue);

			rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt(1);

		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}

		return result;
	}

	// �Խ��� ����Ʈ
	public List<DocuDTO> listDocu(int start, int end) {
		List<DocuDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();

		try {
			sb.append("SELECT * FROM ( SELECT tb.*,  @rownum:=@rownum+1 AS rnum FROM (");
			sb.append(" SELECT docuNum, docuSubject,memId,");
			sb.append(" DATE_FORMAT(docuCreated , '%Y-%m-%d') docuCreated, ");
			sb.append("  docuHitCount FROM docu");
			sb.append(" ORDER BY docuNum DESC) tb,");
			sb.append(" (SELECT @rownum:=0) T)tb1 WHERE rnum >= ? and rnum <= ?");

			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				DocuDTO dto = new DocuDTO();

				dto.setDocuNum(rs.getInt("docuNum"));
				dto.setDocuSubject(rs.getString("docuSubject"));
				dto.setMemId(rs.getString("memId"));
				dto.setDocuCreated(rs.getString("docuCreated"));
				dto.setDocuHitCount(rs.getInt("docuHitCount"));


				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		return list;
	}
	//�˻��� �� ����Ʈ
	public List<DocuDTO> listDocu (int start, int end, String searchKey, String searchValue) {
	      List<DocuDTO> list=new ArrayList<>();
	      PreparedStatement pstmt=null;
	      StringBuffer sb= new StringBuffer();
	      ResultSet rs=null;
	      
	      try {
	    	  	sb.append("SELECT * FROM ( SELECT tb.*,  @rownum:=@rownum+1 AS rnum FROM (");
				sb.append(" SELECT docuNum, docuSubject,memId,");
				sb.append(" DATE_FORMAT(docuCreated , '%Y-%m-%d') docuCreated, docuHitCount FROM docu");
				if(searchKey.equals("memId"))
					sb.append(" WHERE memId =?");
				else
					sb.append(" WHERE " + searchKey + " LIKE CONCAT('%', ? ,'%') ");
				sb.append(" ORDER BY docuNum DESC) tb,");
				sb.append(" (SELECT @rownum:=0) T)tb1 WHERE rnum >= ? and rnum <= ?");
				
				pstmt=conn.prepareStatement(sb.toString());
				
				pstmt.setString(1, searchValue);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					DocuDTO dto = new DocuDTO();
					
					dto.setDocuNum(rs.getInt("DocuNum"));
					dto.setDocuSubject(rs.getString("docuSubject"));
					dto.setMemId(rs.getString("memId"));
					dto.setDocuCreated(rs.getString("docuCreated"));
					dto.setDocuHitCount(rs.getInt("docuHitCount"));
				
					
					list.add(dto);
				}
				rs.close();
				pstmt.close();
	      } catch (Exception e) {
	         System.out.println(e.toString());
	      }
	      
	      return list;
	 }
	

	// �Խ��� �ۺ���
	public DocuDTO readDocu(int docuNum) {
		DocuDTO dto = null;
		PreparedStatement pstmt = null;
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;

		try {
			sb.append("SELECT docuNum, memId, docuSubject, docuContent,");
			sb.append(" docuFile, DATE_FORMAT(docuCreated , '%Y-%m-%d %h:%i:%s') docuCreated,");
			sb.append("  docuHitCount, docuRecomm, originalFilename, filesize");
			sb.append(" FROM docu");
			sb.append(" WHERE docuNum=?");

			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, docuNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new DocuDTO();
				dto.setDocuNum(docuNum);
				dto.setMemId(rs.getString("memId"));
				dto.setDocuSubject(rs.getString("docuSubject"));
				dto.setDocuContent(rs.getString("docuContent"));
				dto.setDocuFile(rs.getString("docuFile"));
				dto.setDocuCreated(rs.getString("docuCreated"));
			    dto.setDocuHitCount(rs.getInt("docuHitCount"));
			    dto.setDocuRecomm(rs.getInt("docuRecomm"));
			    dto.setFileSize(rs.getLong("filesize"));
				dto.setOriginalFilename(rs.getString("originalFilename"));
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}

		return dto;
	}

	// �Խñ� ����
	public int DocuUpdate(DocuDTO dto) {
		PreparedStatement pstmt = null;
		int result = 0;
		StringBuffer sb = new StringBuffer();

		try {
			sb.append("UPDATE docu set docuSubject=?, docuContent=?,");
			sb.append(" docuFile=?,  originalFilename=?, filesize=? ,");
			sb.append(" docuCreated=NOW() WHERE docuNum=?");

			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, dto.getDocuSubject());
			pstmt.setString(2, dto.getDocuContent());
			pstmt.setString(3, dto.getDocuFile());
			pstmt.setString(4, dto.getOriginalFilename());
			pstmt.setLong(5, dto.getFileSize());
			pstmt.setInt(6, dto.getDocuNum());

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
		}

		return result;
	}
    
	public int deleteDocu(int docuNum){
		int result=0;
		PreparedStatement pstmt = null;
		String sql;
		
		sql="DELETE FROM docuReply WHERE docuNum=?";
	      try {
	         pstmt =conn.prepareStatement(sql);
	         pstmt.setInt(1, docuNum);
	         result = pstmt.executeUpdate();
	      } catch (Exception e) {
	         System.out.println(e.toString());
	      } finally {
	         if(pstmt!=null){
	            try {
	               pstmt.close();
	            } catch (Exception e2) {      
	            }
	         }
	      }
		
		sql="DELETE FROM docu WHERE docuNum=?";
		try {
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setInt(1, docuNum);
		   result = pstmt.executeUpdate();
		   
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(pstmt !=null){
				try {
					pstmt.close();
				} catch (Exception e2) {					
				}
			}
		}
		return result;
	}
	// ��ȸ�� ����
	public int DocuHitCount(int num) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "UPDATE docu SET docuHitCount= docuHitCount+1 WHERE docuNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();
			pstmt.close();
			pstmt = null;
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}
	
	 // ������
	public DocuDTO preReadDocu(int docuNum, String searchKey, String searchValue) {
		DocuDTO dto =null;
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			if(searchValue!=null && searchValue.length() != 0) {
				sb.append("SELECT * FROM (");
				sb.append(" SELECT tb.*,  @rownum:=@rownum+1 AS rnum FROM (");
				sb.append(" SELECT docuNum, docuSubject,memId,");
				sb.append(" DATE_FORMAT(docuCreated , '%Y-%m-%d') docuCreated, docuHitCount,");
				sb.append(" docuFile, docuRecomm  FROM docu");
				if(searchKey.equals("memId"))
					sb.append(" WHERE memId =?");
				else
					sb.append(" WHERE " + searchKey + " LIKE CONCAT('%', ? ,'%') ");
				sb.append(" AND docuNum>?");
				sb.append(" ORDER BY docuNum ASC) tb,");
				sb.append(" (SELECT @rownum:=0) T)tb1");
				sb.append(" WHERE rnum =1");
				
				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setString(1, searchValue);
				pstmt.setInt(2, docuNum);
			} else {
				sb.append("SELECT * FROM (");
				sb.append(" SELECT tb.*,  @rownum:=@rownum+1 AS rnum FROM (");
				sb.append(" SELECT docuNum, docuSubject,memId,");
				sb.append(" DATE_FORMAT(docuCreated , '%Y-%m-%d') docuCreated, docuHitCount,");
				sb.append(" docuFile, docuRecomm  FROM docu");
				sb.append(" WHERE docuNum > ?");
				sb.append(" ORDER BY docuNum ASC) tb,");
				sb.append(" (SELECT @rownum:=0) T)tb1");
				sb.append(" WHERE rnum =1");
				
				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setInt(1, docuNum);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new DocuDTO();
				dto.setDocuNum(rs.getInt("docuNum"));
				dto.setDocuSubject(rs.getString("docuSubject"));
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	// ������
	public DocuDTO nextReadDocu(int docuNum, String searchKey, String searchValue) {
		DocuDTO dto =null;
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			if(searchValue!=null && searchValue.length() != 0) {
				sb.append("SELECT * FROM (");
				sb.append(" SELECT tb.*,  @rownum:=@rownum+1 AS rnum FROM (");
				sb.append(" SELECT docuNum, docuSubject,memId,");
				sb.append(" DATE_FORMAT(docuCreated , '%Y-%m-%d') docuCreated, docuHitCount,");
				sb.append(" docuFile, docuRecomm  FROM docu");
				if(searchKey.equals("memId"))
					sb.append(" WHERE memId =?");
				else
					sb.append(" WHERE " + searchKey + " LIKE CONCAT('%', ? ,'%') ");
				sb.append(" AND docuNum<?");
				sb.append(" ORDER BY docuNum ASC) tb,");
				sb.append(" (SELECT @rownum:=0) T)tb1");
				sb.append(" WHERE rnum =1");
				
				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setString(1, searchValue);
				pstmt.setInt(2, docuNum);
			} else {
				sb.append("SELECT * FROM (");
				sb.append(" SELECT tb.*,  @rownum:=@rownum+1 AS rnum FROM (");
				sb.append(" SELECT docuNum, docuSubject,memId,");
				sb.append(" DATE_FORMAT(docuCreated , '%Y-%m-%d') docuCreated, docuHitCount,");
				sb.append(" docuFile, docuRecomm  FROM docu");
				sb.append(" WHERE docuNum < ?");
				sb.append(" ORDER BY docuNum DESC) tb,");
				sb.append(" (SELECT @rownum:=0) T)tb1");
				sb.append(" WHERE rnum =1");
				
				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setInt(1, docuNum);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new DocuDTO();
				dto.setDocuNum(rs.getInt("docuNum"));
				dto.setDocuSubject(rs.getString("docuSubject"));
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	// ���� ==========================
	//��� ���
	public int insertDocuReply(DocuReplyDTO dto){
	      int result=0;
	      PreparedStatement pstmt=null;
	      StringBuffer sb=new StringBuffer();
	      
	      try {
	         sb.append("INSERT INTO docuReply(docuR_content, memId, docuNum)");
	         sb.append("VALUES (?, ?, ?)");
	         
	         pstmt=conn.prepareStatement(sb.toString());
	         pstmt.setString(1, dto.getDocuR_content());
	         pstmt.setString(2, dto.getMemId());
	         pstmt.setInt(3, dto.getDocuNum());
	         
	         result=pstmt.executeUpdate();
	      } catch (Exception e) {
	         System.out.println(e.toString());
	      } finally {
	         if(pstmt!=null)
	            try {
	               pstmt.close();
	            } catch (SQLException e) {   
	            }
	      }
	      return result;
	   }
	   
	// ��� ����
	public int dataCountDocuReply(int docuNum) {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT IFNULL(COUNT(*), 0) FROM docuReply where docuNum=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, docuNum);
			
			rs=pstmt.executeQuery();
			if(rs.next())
				result=rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return result;
	}
	
	// ��� ����Ʈ
	public List<DocuReplyDTO> listDocuReply(int docuNum, int start, int end) {
		List<DocuReplyDTO> list= new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("SELECT * FROM ( SELECT tb.*,  @rownum:=@rownum+1 AS rnum FROM (");
			sb.append(" SELECT docuR_Num, docuNum, memId, docuR_Content,");
			sb.append(" DATE_FORMAT(docuR_Created , '%Y-%m-%d') docuR_Created FROM docuReply");
			sb.append(" WHERE docuNum=?");
			sb.append(" ORDER BY docuR_Num DESC) tb,");
			sb.append(" (SELECT @rownum:=0) T)tb1 WHERE rnum >= ? and rnum <= ?");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, docuNum);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				DocuReplyDTO dto= new DocuReplyDTO();
				
				dto.setDocuR_num(rs.getInt("docuR_num"));
				dto.setDocuNum(rs.getInt("docuNum"));
				dto.setMemId(rs.getString("memId"));
				dto.setDocuR_content(rs.getString("docuR_content"));
				dto.setDocuR_created(rs.getString("docuR_created"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		return list;
	}
	
	// ��� ����
	   public int deleteDocuReply(int docuR_num){
		      int result = 0;
		      PreparedStatement pstmt=null;
		      String sql;
		      
		      sql="DELETE FROM docuReply WHERE docuR_num=?";
		      try {
		         pstmt =conn.prepareStatement(sql);
		         pstmt.setInt(1, docuR_num);
		         result = pstmt.executeUpdate();
		      } catch (Exception e) {
		         System.out.println(e.toString());
		      } finally {
		         if(pstmt!=null){
		            try {
		               pstmt.close();
		            } catch (Exception e2) {      
		            }
		         }
		      }
		      return result;
		   }
	
	
	
}
