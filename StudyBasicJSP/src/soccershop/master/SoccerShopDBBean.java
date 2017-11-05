package soccershop.master;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import ch13.board.BoardDataBean;



public class SoccerShopDBBean {
	
	private static SoccerShopDBBean instance  = new SoccerShopDBBean();
	
	public static SoccerShopDBBean getInstance() {
		return instance;
	}
	
	private SoccerShopDBBean() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
		return ds.getConnection();
	}
	
	public int mangaerCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		String sql ="";
		sql = "select managerpasswd from manager where managerid = ?";
		int x = -1;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("managerpasswd");
				if(dbpasswd.equals(passwd)) {
					x=1;
				} else
					x = 0;
			}else {
				x=-1;
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) 
				try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
		return x;
	}
	
	public void insertProduct(SoccerShopDataBean product) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="";
		sql = "insert into product values(seq_product_id.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProduct_kind());
			pstmt.setString(2, product.getProduct_title());
			pstmt.setInt(3, product.getProduct_price());
			pstmt.setShort(4, product.getProduct_count());
			pstmt.setString(5, product.getArea());
			pstmt.setString(6, product.getBrand());
			pstmt.setString(7, product.getLaunch_date());
			pstmt.setString(8, product.getProduct_image());
			pstmt.setString(9, product.getProduct_content());
			pstmt.setByte(10, product.getDiscount_rate());
			pstmt.setTimestamp(11, product.getReg_date());
			pstmt.setString(12, product.getProduct_contimage());
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
	}
	
	public int getProductCount() throws Exception {
		Connection conn  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select count(*) from product");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				x = rs.getInt(1);
		} catch(Exception ex) {
			ex.printStackTrace();
		}  finally {
			if(rs != null) 
				try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
		return x;
	}
	public int getProductCount(String product_kind) throws Exception {
		Connection conn  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select count(*) from product"
					+ " where product_kind=?");
			pstmt.setString(1, product_kind);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				x = rs.getInt(1);
		} catch(Exception ex) {
			ex.printStackTrace();
		}  finally {
			if(rs != null) 
				try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
		return x;
	}
	
	public List<SoccerShopDataBean> getProducts(String product_kind) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SoccerShopDataBean> productList = null;
		
		try {
			conn = getConnection();
			String sql1 = "select * from product order by reg_date desc";
			String sql2 = "select * from product"
					+ " where product_kind=? order by reg_date desc";
			if(product_kind.equals("all")) {
				pstmt = conn.prepareStatement(sql1);
			} else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, product_kind);
			}
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				productList = new ArrayList<SoccerShopDataBean>();
				
				do {
					SoccerShopDataBean product = new SoccerShopDataBean();
					
					product.setProduct_id(rs.getInt("product_id"));
					product.setProduct_kind(rs.getString("product_kind"));
					product.setProduct_title(rs.getString("product_title"));
					product.setProduct_price(rs.getInt("product_price"));
					product.setProduct_count(rs.getShort("product_count"));
					product.setArea(rs.getString("area"));
					product.setBrand(rs.getString("brand"));
					product.setLaunch_date(rs.getString("launch_date"));
					product.setProduct_image(rs.getString("product_image"));
					product.setDiscount_rate(rs.getByte("discount_rate"));
					product.setReg_date(rs.getTimestamp("reg_date"));
					product.setProduct_contimage(rs.getString("product_contimage"));
					
					productList.add(product);
				} while(rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) 
				try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
		return productList;
	}
	
	public List<SoccerShopDataBean> getProducts(String product_kind, int start,
			int end) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SoccerShopDataBean> productList = null;
		
		try {
			conn = getConnection();
			String sql1 = "select * from "
					+ "(select rownum as rnum, pr.* "
					+ "from (select * from product order by reg_date desc) pr) "
					+ "where rnum between ? and ?";
			String sql2 = "select * from "
					+ "(select rownum as rnum, pr.* "
					+ "from (select * from product where product_kind=? order by reg_date desc) pr) "
					+ "where rnum between ? and ?";
			
			if(product_kind.equals("all")) {
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, product_kind);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				productList = new ArrayList<SoccerShopDataBean>(end);
				
				do {
					SoccerShopDataBean product = new SoccerShopDataBean();
					
					product.setProduct_id(rs.getInt("product_id"));
					product.setProduct_kind(rs.getString("product_kind"));
					product.setProduct_title(rs.getString("product_title"));
					product.setProduct_price(rs.getInt("product_price"));
					product.setProduct_count(rs.getShort("product_count"));
					product.setArea(rs.getString("area"));
					product.setBrand(rs.getString("brand"));
					product.setLaunch_date(rs.getString("launch_date"));
					product.setProduct_image(rs.getString("product_image"));
					product.setDiscount_rate(rs.getByte("discount_rate"));
					product.setReg_date(rs.getTimestamp("reg_date"));
					product.setProduct_contimage(rs.getString("product_contimage"));
					
					productList.add(product);
				} while(rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) 
				try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
		return productList;
	}
	
	public SoccerShopDataBean[] getProducts(String product_kind, int count) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SoccerShopDataBean [] productList = null;
		String sql = "";
		/*sql = "select * from book where book_kind = ? "
				+ " order by reg_date desc limit ?,?";*/
		sql = "select * from "
				+ "(select rownum as rnum, bo.* "
				+ "from (select * from product where product_kind=? order by reg_date desc) bo) "
				+ "where rnum between ? and ?";
		int i = 0;
		
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product_kind);
			pstmt.setInt(2, 0);
			pstmt.setInt(3, count);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				productList = new SoccerShopDataBean[count];
				do {
					SoccerShopDataBean product = new SoccerShopDataBean();
					product.setProduct_id(rs.getInt("product_id"));
					product.setProduct_kind(rs.getString("product_kind"));
					product.setProduct_title(rs.getString("product_title"));
					product.setProduct_price(rs.getInt("product_price"));
					product.setProduct_count(rs.getShort("product_count"));
					product.setArea(rs.getString("area"));
					product.setBrand(rs.getString("brand"));
					product.setLaunch_date(rs.getString("Launch_date"));
					product.setProduct_image(rs.getString("product_image"));
					product.setDiscount_rate(rs.getByte("discount_rate"));
					product.setReg_date(rs.getTimestamp("reg_date"));
					product.setProduct_contimage(rs.getString("product_contimage"));
					
					productList[i] = product;
					
					i++;
				} while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) 
				try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
		return productList;
	} 
	
	public SoccerShopDataBean getProduct(int productId) throws Exception {
		Connection conn  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SoccerShopDataBean product = null;
		String sql = "select * from product where product_id = ?";
		
		try { 
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new SoccerShopDataBean();
				
				product.setProduct_kind(rs.getString("product_kind"));
				product.setProduct_title(rs.getString("product_title"));
				product.setProduct_price(rs.getInt("product_price"));
				product.setProduct_count(rs.getShort("product_count"));
				product.setArea(rs.getString("area"));
				product.setBrand(rs.getString("brand"));
				product.setLaunch_date(rs.getString("launch_date"));
				product.setProduct_image(rs.getString("product_image"));
				product.setProduct_content(rs.getString("product_content"));
				product.setDiscount_rate(rs.getByte("discount_rate"));
				product.setProduct_contimage(rs.getString("product_contimage"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) 
				try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
		return product;
	}
	
	public void updateProduct(SoccerShopDataBean product, int productId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="";
		sql = "update product set product_kind=?, product_title=?, product_price=?,"
				+ "product_count=?, area=?, brand=?, launch_date=?,"
				+ "product_image=?, product_content=?, discount_rate=?, "
				+ "product_contimage=? where product_id=?";
		
		try {
			
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, product.getProduct_kind());
		pstmt.setString(2, product.getProduct_title());
		pstmt.setInt(3, product.getProduct_price());
		pstmt.setShort(4, product.getProduct_count());
		pstmt.setString(5, product.getArea());
		pstmt.setString(6, product.getBrand());
		pstmt.setString(7, product.getLaunch_date());
		pstmt.setString(8, product.getProduct_image());
		pstmt.setString(9, product.getProduct_content());
		pstmt.setByte(10, product.getDiscount_rate());
		pstmt.setString(11, product.getProduct_contimage());
		pstmt.setInt(12, productId);
		
		pstmt.executeUpdate();
		
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
	}
	
	public void deleteProduct(int productId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try { 
			conn = getConnection();
			
			pstmt = conn.prepareStatement("delete from product where product_id = ?");
			pstmt.setInt(1, productId);
			
			pstmt.executeUpdate();
		}  catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) 
				try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
	}
	
}
