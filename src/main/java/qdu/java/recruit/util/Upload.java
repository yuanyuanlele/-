package qdu.java.recruit.util;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;


public class Upload {

    /**
     * @param request
     * @param parameter("上传图片控件名称")
     * @param savePath("/path1/path2"绝对路径)
     * @return 成功返回相对路径，失败或超出大小返回false
     */
    private String fileNewName;

    private String fileName;

    public String getFileNewName() {
        return fileNewName;
    }

    public String getFileName(){
        return fileName;
    }

    public void setFileNewName(String fileNewName) {
        this.fileNewName = fileNewName;
    }

    public String upload(HttpServletRequest request, String parameter, String savePath, int maxSize, String mapPath) {
        String path = "";
        String urlPath = "";
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        if (commonsMultipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
            Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
            if (iterator.hasNext()) {
                MultipartFile multipartFile = multipartHttpServletRequest.getFile(parameter);
                if (multipartFile != null && multipartFile.getSize() < maxSize && multipartFile.getSize()>0) {
                    int randomNo=(int)(Math.random()*1000000);
                    fileName = multipartFile.getOriginalFilename();
                    int beginIndex = fileName.lastIndexOf(".");
                    fileNewName = new java.text.SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date())+randomNo+"-"+fileName;
                    File saveFile = new File(savePath);
                    if (!saveFile.isDirectory()) {
                        saveFile.mkdirs();
                    }
                    File newFile = new File(savePath+"/" + fileNewName);
                    try {
                        multipartFile.transferTo(newFile);
                        urlPath =mapPath +"/"+ fileNewName;
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } else {
                    request.setAttribute("msg","上传的文件太大，请重新选择");
                    //文件大小超出限制
                    urlPath = "";
                }
            }
        }
        return urlPath;
    }
}
