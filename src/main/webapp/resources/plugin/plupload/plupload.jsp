<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="net.coobird.thumbnailator.*" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="net.coobird.thumbnailator.geometry.Positions" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%


/**
 * KindEditor JSP
 * 
 * 本JSP程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 * 
 */
 String BASE_PATH = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort();

//文件保存目录路径
String savePath = pageContext.getServletContext().getRealPath("/") + "resources/upload/";

response.setContentType("text/html; charset=UTF-8");

//检查目录
File uploadDir = new File(savePath);
if(!uploadDir.isDirectory()){
	System.out.println("上传目录不存在");
	return;
}
//检查目录写权限
if(!uploadDir.canWrite()){
	System.out.println("上传目录没有写权限。");
	return;
}

//创建文件夹
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
String ymd = sdf.format(new Date());
savePath += ymd + "/";
File dirFile = new File(savePath);
if (!dirFile.exists()) {
	dirFile.mkdirs();
}

FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
upload.setHeaderEncoding("UTF-8");
List<FileItem> items = upload.parseRequest(request);
Iterator<FileItem> itr = items.iterator();
while (itr.hasNext()) {
	FileItem item = (FileItem) itr.next();
	String fileName = item.getName();
	//long fileSize = item.getSize();
	if (!item.isFormField()) {
		//检查扩展名
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
		try{
			File uploadedFile = new File(savePath, newFileName);
			item.write(uploadedFile);
			Thumbnails.of(pageContext.getServletContext().getRealPath("/")+"resources"+File.separator+"upload"+File.separator+ymd+File.separator+newFileName).size(240, 240).toFile(pageContext.getServletContext().getRealPath("/")+"resources"+File.separator+"upload"+File.separator+ymd+File.separator+newFileName); 
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("上传文件失败R。");
			break;
		}
		System.out.print(ymd+"/"+newFileName);
		out.println(ymd+"/"+newFileName);
	}
}
%>
