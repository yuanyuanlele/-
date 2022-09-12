package qdu.java.recruit.controller.admin;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import qdu.java.recruit.entity.*;
import qdu.java.recruit.service.*;
import qdu.java.recruit.util.MD5Util;
import qdu.java.recruit.util.Upload;
import sun.security.provider.MD5;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;


@Controller
@RequestMapping("/manager")
public class BackManagerController {

    @Autowired
    private BackManagerService backManagerService;

    @Autowired
    private HRService hrService;

    @Autowired
    private ApplicationService applicationService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private UserService userService;

    @Autowired
    private PositionService positionService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private ResumeService resumeService;

    @Autowired
    private NewsService newsService;

    @RequestMapping("/login")
    public String init(){
        return "manager/login";
    }

    @RequestMapping("/index")
    public String index(){
        return "manager/index";
    }

    @RequestMapping("/index_v3")
    public String index_v3() {
        return "manager/index_v3";
    }

    @RequestMapping("/nestable_list")
    public String teams_board() {
        return "manager/nestable_list";
    }

    @RequestMapping("/contacts")
    public String contacts() {
        return "manager/contacts";
    }

    @RequestMapping("/table_jqgrid")
    public String table() {
        return "manager/table_jqgrid";
    }

    @RequestMapping("/hr_list")
    public String hr_list() {
        return "manager/hr_list";
    }

    @RequestMapping("/notice_list")
    public String notice_list() {
        return "manager/notice_list";
    }

    @RequestMapping("/news_list")
    public String news_list() {
        return "manager/news_list";
    }

    /**
     * 管理员个人信息页面跳转
     * @return
     */
    @RequestMapping("/admin_info")
    public String admin_info() {
        return "manager/admin_info";
    }

    /**
     * HR个人信息页面跳转
     * @return
     */
    @RequestMapping("/hr_info")
    public String hr_info() {
        return "manager/hr_info";
    }

    @RequestMapping("/application_list")
    public String application_list() {
        return "manager/application_list";
    }

    @RequestMapping("/position_list")
    public String position_list() {
        return "manager/position_list";
    }

    @RequestMapping("/resume_list")
    public String resume_list() {
        return "manager/resume_list";
    }

    @RequestMapping("/widgets")
    public String widgets() {
        return "manager/widgets";
    }

    @RequestMapping("/adminlogin")
    @ResponseBody
    public Map<String,Object> login(Long username, String password, String role, HttpSession session){
        Map<String,Object> map = new HashMap<>();
        if(role.equals("admin")){
            int result = backManagerService.backLogin(username, password);
            if(result==0){
                map.put("state","0");
            }else {
                map.put("state","1");
            }
        }else {
            boolean flag=hrService.loginHR(String.valueOf(username), password);
            if (flag){
                map.put("state","1");
            }else {
                map.put("state","0");
            }
        }
        session.setAttribute("username",username);
        session.setAttribute("role",role);
        return map;
    }

    @RequestMapping("/addcompany")
    @ResponseBody
    public Map<String,Object> addcompany(String companyName,String companyCode,String description){
        Map<String,Object> map = new HashMap<>();
        int result = backManagerService.addCompany(companyName,companyCode,description);
        if (result==0){
            map.put("state","0");
        }
        else {
            map.put("state","1");
        }
        return map;
    }


    @RequestMapping(value = "/userareachart", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> area(){
        Map<String,Object> map = new HashMap<>();
        ArrayList<UserAreaEntity> area = backManagerService.userArea();
        UserAreaEntity userAreaEntity;
        for(int i=0; i<area.size(); i++){
            userAreaEntity = area.get(i);
            map.put(userAreaEntity.getArea(),userAreaEntity.getUsernum());
        }
        return map;
    }

    @RequestMapping("webcount")
    @ResponseBody
    public Map<String,Object> webcount(){
        Map<String,Object> map = new HashMap<>();
        WebCountEntity webCountEntity = backManagerService.getWebCount();
        map.put("companynum",webCountEntity.getCompanynum());
        map.put("offernum" ,webCountEntity.getOffernum());
        map.put("usernum",webCountEntity.getUsernum());
        map.put("visitnum",webCountEntity.getVisitnum());
        System.out.println(map);
        return map;
    }

    @RequestMapping("getcompany")
    @ResponseBody
    public String getCompany(){
        Gson gson = new Gson();
        ArrayList<CompanyEntity> companyEntities = backManagerService.getAllCompanies();
        String companyInfo = gson.toJson(companyEntities);
        System.out.println(companyInfo);
        return companyInfo;
    }


    @RequestMapping("getuser")
    @ResponseBody
    public String getUser(){
        Gson gson = new Gson();
        ArrayList<UserEntity> userEntities = backManagerService.getAllUsers();
        String userInfo = gson.toJson(userEntities);
        System.out.println(userInfo);
        return userInfo;
    }

    @RequestMapping("getHr")
    @ResponseBody
    public String getHr(){
        Gson gson = new Gson();
        ArrayList<HREntity> hrEntities = backManagerService.getAllHr();
        ArrayList<HREntity> newEntities=new ArrayList<HREntity>();
        for(int i=0;i<hrEntities.size();i++){
            HREntity hrEntity=hrEntities.get(i);
            DepartmentEntity departmentEntity=departmentService.getDepartment(hrEntity.getDepartmentId());
            if(!StringUtils.isEmpty(departmentEntity)){
                hrEntity.setDepartmentName(departmentEntity.getDepartmentName());
                CompanyEntity companyEntity=companyService.getCompany(departmentEntity.getCompanyId());
                if(!StringUtils.isEmpty(companyEntity)){
                    hrEntity.setCompanyName(companyEntity.getCompanyName());
                }
            }
            newEntities.add(hrEntity);
        }
        String hrInfo = gson.toJson(newEntities);
        System.out.println(hrInfo);
        return hrInfo;
    }


    @RequestMapping("getResume")
    @ResponseBody
    public String getResume(){
        Gson gson = new Gson();
        ArrayList<ResumeEntity> resumeEntities = backManagerService.getAllResume();
        ArrayList<ResumeEntity> newEntities=new ArrayList<ResumeEntity>();
        for(int i=0;i<resumeEntities.size();i++){
            ResumeEntity resumeEntity=resumeEntities.get(i);
            UserEntity userEntity=userService.getUser(resumeEntity.getUserId());
            if(userEntity.getGender()==0){
                userEntity.setSex("男");
            }else {
                userEntity.setSex("女");
            }
            resumeEntity.setUserEntity(userEntity);
            newEntities.add(resumeEntity);
        }
        String resumeInfo = gson.toJson(newEntities);
        System.out.println(resumeInfo);
        return resumeInfo;
    }

    /**
     * 后台招聘信息管理
     * @return
     */
    @RequestMapping("/getPosition")
    @ResponseBody
    public String getPosition(HttpSession session){
        Gson gson = new Gson();
        Long username= (Long) session.getAttribute("username");
        PageInfo<PositionEntity> page=null;
        String role= (String) session.getAttribute("role");
        if(role.equals("admin")){
            page=positionService.findByPage(1,20);
        }else {
            HREntity hrEntity=hrService.getHRByMobile(username+"");
            page=positionService.listPositionByHr(hrEntity.getHrId(),1,20);
        }
        List<PositionEntity> positionEntities=page.getList();
        String positionInfo = gson.toJson(positionEntities);
        return positionInfo;
    }

    /**
     * 后台应聘信息管理
     * @return
     */
    @RequestMapping("/getApplication")
    @ResponseBody
    public String getApplication(HttpSession session){
        Gson gson = new Gson();
        Long username= (Long) session.getAttribute("username");
        PageInfo<ApplicationEntity> page=null;
        String role= (String) session.getAttribute("role");
        if(role.equals("admin")){
            page=applicationService.findByPage(1,20);
        }else {
            HREntity hrEntity=hrService.getHRByMobile(username+"");
            page=applicationService.findByHrPage(1,20,hrEntity.getHrId());
        }
        List<ApplicationEntity> applicationEntities=page.getList();
        String applicationInfo = gson.toJson(applicationEntities);
        return applicationInfo;
    }

    /**
     * 获取所有分类
     * @param request
     * @return
     */
    @RequestMapping("/getCategory")
    @ResponseBody
    public String getCategory(HttpServletRequest request){
        Gson gson = new Gson();
        List<CategoryEntity> categoryEntities=categoryService.getAll();
        String categoryInfo = gson.toJson(categoryEntities);
        return categoryInfo;
    }

    /**
     * 获取所有职位
     * @param request
     * @return
     */
    @RequestMapping("/getDepartment")
    @ResponseBody
    public String getDepartment(HttpServletRequest request,HttpSession session){
        Long username= (Long) session.getAttribute("username");
        HREntity hrEntity=hrService.getHRByMobile(username+"");
        DepartmentEntity departmentEntity=departmentService.getDepartment(hrEntity.getDepartmentId());
        CompanyEntity companyEntity=companyService.getCompany(departmentEntity.getCompanyId());
        Gson gson = new Gson();
        List<DepartmentEntity> departmentEntities=departmentService.getDepartmentByCompany(companyEntity.getCompanyId());
        String departmentInfo = gson.toJson(departmentEntities);
        return departmentInfo;
    }

    /**
     * 发布招聘信息
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/addPosition")
    @ResponseBody
    public String addPosition(PositionEntity positionEntity,HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("sid");
        if(!StringUtils.isEmpty(id)){
            PositionEntity positionEntity1=positionService.getPositionById(Integer.parseInt(id));
            //if(StringUtils.isEmpty(positionEntity.getStatePub())){
                positionEntity.setStatePub(positionEntity1.getStatePub());
            //}
            positionEntity.setValidDate(positionEntity1.getValidDate());
            positionEntity.setPositionId(Integer.parseInt(id));
            positionService.updatePosition(positionEntity);
        }else {
            Long username= (Long) session.getAttribute("username");
            HREntity hrEntity=hrService.getHRByMobile(username+"");
            positionEntity.setHrIdPub(hrEntity.getHrId());
            positionEntity.setReleaseDate(new Date());
            positionEntity.setValidDate(new Date());
            positionEntity.setStatePub(1);
            positionService.savePosition(positionEntity);
        }
        flag=true;
        return String.valueOf(flag);
    }

    /**
     * 删除招聘信息
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/deletePosition")
    @ResponseBody
    public String deletePosition(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("id");
        int status=positionService.deletePosition(Integer.parseInt(id));
        if(status>0){
            flag=true;
        }
        return String.valueOf(flag);
    }

    @RequestMapping("/deleteApplication")
    @ResponseBody
    public String deleteApplication(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("id");
        int status=applicationService.deleteApplication(Integer.parseInt(id));
        if(status>0){
            flag=true;
        }
        return String.valueOf(flag);
    }

    /**
     * 返回修改招聘信息对象
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/updatePosition")
    @ResponseBody
    public String updatePosition(HttpServletRequest request,HttpSession session){
        Gson gson = new Gson();
        String id=request.getParameter("id");
        PositionEntity positionEntity=positionService.getPositionById(Integer.parseInt(id));
        String positionInfo = gson.toJson(positionEntity);
        return positionInfo;
    }

    /**
     * 删除用户
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("id");
        int status=userService.deleteUser(Integer.parseInt(id));
        if(status>0){
            flag=true;
        }
        return String.valueOf(flag);
    }

    /**
     * 后台公告信息管理
     * @return
     */
    @RequestMapping("/getNotice")
    @ResponseBody
    public String getNotice(HttpSession session){
        Gson gson = new Gson();
        Long username= (Long) session.getAttribute("username");
        PageInfo<NoticeEntity> page=null;
        String role= (String) session.getAttribute("role");
        if(role.equals("admin")){
            page=noticeService.findByPage1(1,20);
        }else {
            HREntity hrEntity=hrService.getHRByMobile(username+"");
            page=noticeService.findByPage(hrEntity.getHrId(),1,20);
        }
        List<NoticeEntity> noticeEntities=page.getList();
        String positionInfo = gson.toJson(noticeEntities);
        return positionInfo;
    }

    /**
     * 发布公告信息
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/addNotice")
    @ResponseBody
    public String addNotice(NoticeEntity noticeEntity,HttpServletRequest request,HttpSession session){
        String id=request.getParameter("sid");
        boolean flag=false;
        if(!StringUtils.isEmpty(id)){
            noticeEntity.setId(Integer.parseInt(id));
            noticeService.update(noticeEntity);
        }else {
            Long username= (Long) session.getAttribute("username");
            HREntity hrEntity=hrService.getHRByMobile(username+"");
            noticeEntity.setHrId(hrEntity.getHrId());
            noticeEntity.setAddDate(new Date());
            noticeService.add(noticeEntity);
        }
        flag=true;
        return String.valueOf(flag);
    }

    /**
     * 删除公告信息
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/deleteNotice")
    @ResponseBody
    public String deleteNotice(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("id");
        int status=noticeService.delete(Integer.parseInt(id));
        if(status>0){
            flag=true;
        }
        return String.valueOf(flag);
    }

    /**
     * 返回修改公告信息对象
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/updateNotice")
    @ResponseBody
    public String updateNotice(HttpServletRequest request,HttpSession session){
        Gson gson = new Gson();
        String id=request.getParameter("id");
        NoticeEntity noticeEntity=noticeService.findById(Integer.parseInt(id));
        String noticeInfo = gson.toJson(noticeEntity);
        return noticeInfo;
    }

    /**
     * 后台资讯管理
     * @return
     */
    @RequestMapping("/getNews")
    @ResponseBody
    public String getNews(HttpSession session){
        Gson gson = new Gson();
        Long username= (Long) session.getAttribute("username");
        PageInfo<NewsEntity> page=null;
        String role= (String) session.getAttribute("role");
        page=newsService.findByPage(1,20);
        List<NewsEntity> newsEntities=page.getList();
        String newsInfo = gson.toJson(newsEntities);
        return newsInfo;
    }

    /**
     * 发布资讯
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/addNews")
    @ResponseBody
    public String addNews(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("sid");
        NewsEntity newsEntity=new NewsEntity();
        String title=request.getParameter("title");
        String summary=request.getParameter("summary");
        String content=request.getParameter("content");
        String savePath = "E:/upload/newsIcon",mapPath="/upload/newsIcon",parameter ="icon";
        Upload upload = new Upload();
        String imgUrl = upload.upload(request, parameter, savePath, 2079152,mapPath);
        if(!StringUtils.isEmpty(id)){
            newsEntity.setId(Integer.parseInt(id));
            NewsEntity news1=newsService.findById(Integer.parseInt(id));
            if(!StringUtils.isEmpty(imgUrl)){
                newsEntity.setIcon(imgUrl);
            }else {
                newsEntity.setIcon(news1.getIcon());
            }
            if(!StringUtils.isEmpty(title)){
                newsEntity.setTitle(title);
            }
            if(!StringUtils.isEmpty(summary)){
                newsEntity.setSummary(summary);
            }
            if(!StringUtils.isEmpty(content)){
                newsEntity.setContent(content);
            }
            newsEntity.setAddUser(news1.getAddUser());
            newsEntity.setAddDate(news1.getAddDate());
            newsService.update(newsEntity);
        }else {
            Long username= (Long) session.getAttribute("username");
            newsEntity.setAddUser(username+"");
            newsEntity.setAddDate(new Date());
            newsEntity.setIcon(imgUrl);
            newsEntity.setTitle(title);
            newsEntity.setSummary(summary);
            newsEntity.setContent(content);
            newsService.add(newsEntity);
        }
        flag=true;
        return String.valueOf(flag);
    }

    /**
     * 返回资讯对象
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/updateNews")
    @ResponseBody
    public String updateNews(HttpServletRequest request,HttpSession session){
        Gson gson = new Gson();
        String id=request.getParameter("id");
        NewsEntity newsEntity=newsService.findById(Integer.parseInt(id));
        String newsInfo = gson.toJson(newsEntity);
        return newsInfo;
    }

    /**
     * 删除资讯
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/deleteNews")
    @ResponseBody
    public String deleteNews(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("id");
        int status=newsService.delete(Integer.parseInt(id));
        if(status>0){
            flag=true;
        }
        return String.valueOf(flag);
    }

    /**
     * 获取所有公司
     * @param request
     * @return
     */
    @RequestMapping("/getCompany")
    @ResponseBody
    public String getCompany(HttpServletRequest request){
        Gson gson = new Gson();
        List<CompanyEntity> categoryEntities=companyService.getAll();
        String companyInfo = gson.toJson(categoryEntities);
        return companyInfo;
    }

    /**
     * 添加Hr
     * @param
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/addHr")
    @ResponseBody
    public String addHr(HREntity hrEntity,HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("sid");
        String companyId=request.getParameter("companyId");
        CompanyEntity companyEntity=companyService.getCompany(Integer.parseInt(companyId));
        List<DepartmentEntity> departmentEntityList=departmentService.getDepartmentByCompany(companyEntity.getCompanyId());
        for(DepartmentEntity department:departmentEntityList){
            if(department.getDepartmentName().equals("行政部")){
                hrEntity.setDepartmentId(department.getDepartmentId());
            }
        }
        if(!StringUtils.isEmpty(id)){
            hrEntity.setHrId(Integer.parseInt(id));
            hrService.updateHR(hrEntity);
        }else {
            hrService.registerHR(hrEntity);
        }
        flag=true;
        return String.valueOf(flag);
    }

    /**
     * 返回修改Hr信息对象
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/updateHr")
    @ResponseBody
    public String updateHr(HttpServletRequest request,HttpSession session){
        Gson gson = new Gson();
        String id=request.getParameter("id");
        HREntity hrEntity=hrService.getHR(Integer.parseInt(id));
        DepartmentEntity departmentEntity=departmentService.getDepartment(hrEntity.getDepartmentId());
        hrEntity.setCompanyId(departmentEntity.getCompanyId());
        String hrInfo = gson.toJson(hrEntity);
        return hrInfo;
    }

    @RequestMapping("/deleteHr")
    @ResponseBody
    public String deleteHr(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("id");
        int status=hrService.deleteHr(Integer.parseInt(id));
        if(status>0){
            flag=true;
        }
        return String.valueOf(flag);
    }

    @RequestMapping("/deleteResume")
    @ResponseBody
    public String deleteResume(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("id");
        int status=resumeService.delete(Integer.parseInt(id));
        if(status>0){
            flag=true;
        }
        return String.valueOf(flag);
    }

    @RequestMapping("/updateResume")
    @ResponseBody
    public String updateResume(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("id");
        String state=request.getParameter("state");
        int status=resumeService.updateState(state,Integer.parseInt(id));
        if(status>0){
            flag=true;
        }
        return String.valueOf(flag);
    }

    @RequestMapping("/updateApplication")
    @ResponseBody
    public String updateApplication(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String id=request.getParameter("id");
        String state=request.getParameter("state");
        int status=applicationService.updateState(state,Integer.parseInt(id));
        if(status>0){
            flag=true;
        }
        return String.valueOf(flag);
    }

    /**
     * 返回修改管理员信息对象
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/findAdminOne")
    @ResponseBody
    public String findAdminOne(HttpServletRequest request,HttpSession session){
        Gson gson = new Gson();
        Long username= (Long) session.getAttribute("username");
        AdminEntity adminEntity=backManagerService.findById(username+"");
        String adminInfo = gson.toJson(adminEntity);
        return adminInfo;
    }

    /**
     * 返回修改HR信息对象
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/findHrOne")
    @ResponseBody
    public String findHrOne(HttpServletRequest request,HttpSession session){
        Gson gson = new Gson();
        Long username= (Long) session.getAttribute("username");
        HREntity hrEntity=hrService.getHRByMobile(username+"");
        String hrInfo = gson.toJson(hrEntity);
        return hrInfo;
    }

    /**
     * 管理员修改信息
     * @param
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/updateInfo")
    @ResponseBody
    public String updateInfo(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String mobile=request.getParameter("mobile");
        Long username= (Long) session.getAttribute("username");
        AdminEntity adminEntity=backManagerService.findById(username+"");
        if(!password.equals(adminEntity.getPassword())){
            adminEntity.setPassword(MD5Util.md5(password));
        }
        adminEntity.setEmail(email);
        adminEntity.setMobile(mobile);
        backManagerService.updateAdmin(adminEntity);
        flag=true;
        return String.valueOf(flag);
    }

    /**
     * HR修改信息
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/updateHrInfo")
    @ResponseBody
    public String updateHrInfo(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String hrPassword=request.getParameter("hrPassword");
        String hrName=request.getParameter("hrName");
        String hrEmail=request.getParameter("hrEmail");
        String description=request.getParameter("description");
        Long username= (Long) session.getAttribute("username");
        HREntity hrEntity=hrService.getHRByMobile(username+"");
        hrEntity.setHrPassword(hrPassword);
        hrEntity.setDescription(description);
        hrEntity.setHrEmail(hrEmail);
        hrEntity.setHrName(hrName);
        hrService.updateHR(hrEntity);
        flag=true;
        return String.valueOf(flag);
    }

    @RequestMapping("/deleteCompany")
    @ResponseBody
    public String deleteCompany(HttpServletRequest request,HttpSession session){
        boolean flag=false;
        String companyId=request.getParameter("companyId");
        int status=companyService.delete(Integer.parseInt(companyId));
        if(status>0){
            flag=true;
        }
        return String.valueOf(flag);
    }


}
