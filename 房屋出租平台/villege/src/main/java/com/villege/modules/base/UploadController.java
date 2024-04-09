package com.villege.modules.base;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;
import com.villege.common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;


@RestController
public class UploadController extends AbstractController {
    @Value("${upload.absPath}")
    String absPath;
    @Value("${upload.urlPrefix}")
    String urlPrefix;
    //    @Autowired
    //    private AppConfig appConfig;
    @RequestMapping("/sys/agent/logoUpload")
    public R agentLogoUpload(@RequestParam("logo")MultipartFile file1, HttpServletRequest request) throws  Exception {
        if(file1.getOriginalFilename().equals("")){
            return  R.error("没有选中要上传的文件");
        }else {
            String basePath = "";

            basePath = uploadLocal(file1,request);

            return  R.ok().put("data",basePath);
        }
    }
    public String  uploadLocal(MultipartFile file1, HttpServletRequest request){
        String basePath="";
        try {
            String picName = UUID.randomUUID().toString();
            // 截取文件的扩展名(如.jpg)
            String oriName = file1.getOriginalFilename();
            System.out.println("--上传文件名-->>" + oriName);
            String extName = oriName.substring(oriName.lastIndexOf("."));

            String newFileName = picName + extName;
            File targetFile = new File(absPath, newFileName);
            // 保存文件
            file1.transferTo(targetFile);
            String path = request.getContextPath();
//            basePath = request.getScheme() + "://" + request.getLocalName() + ":" + request.getLocalPort() + "/" + path + "/parkPic/agent/" + newFileName;
            basePath = urlPrefix + "villegePic/agent/" + newFileName;

        }catch(Exception e){
            e.printStackTrace();
        }
        return basePath;
    }
}
