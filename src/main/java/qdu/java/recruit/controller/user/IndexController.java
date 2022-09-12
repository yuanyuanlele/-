package qdu.java.recruit.controller.user;

import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import qdu.java.recruit.controller.BaseController;
import qdu.java.recruit.entity.HREntity;
import qdu.java.recruit.entity.NewsEntity;
import qdu.java.recruit.entity.NoticeEntity;
import qdu.java.recruit.entity.PositionEntity;
import qdu.java.recruit.service.HRService;
import qdu.java.recruit.service.NewsService;
import qdu.java.recruit.service.NoticeService;
import qdu.java.recruit.service.PositionService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@EnableAutoConfiguration
@Api("页面跳转控制器")
public class IndexController extends BaseController {
    private static final Logger LOGGER = LogManager.getLogger();

    @Autowired
    private PositionService positionService;

    @Autowired
    private HRService hrService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private NewsService newsService;

    /**
     * 用户登录
     *
     * @return
     */
    @GetMapping(value = "user/login")
    public String userLogin() {
        return this.userDirect("user_login");
    }

    /**
     * 主页
     *
     * @return
     */
    @GetMapping(value = "")
    public String index() {
        return this.userDirect("index");
    }

    /**
     * 职位搜索 列表页
     *
     * @return
     */
    @GetMapping(value = "/searchlist")
    public String search() { return this.userDirect("search_list"); }

    /**
     * 职位分类 列表页
     *
     * @return
     */
    @GetMapping(value = "/category/{id}")
    public String list() {
        return this.userDirect("category_list");
    }

    /**
     * 职位细节页
     *
     * @return
     */
    @GetMapping(value = "/position/{id}")
    public String getPosition(HttpServletRequest request,@PathVariable("id")int id) {
        PositionEntity positionEntity=positionService.getPositionById(id);
        HREntity hrEntity=hrService.getHR(positionEntity.getHrIdPub());
        List<NoticeEntity> noticeList=noticeService.findAllByHrId(hrEntity.getHrId());
        request.getSession().setAttribute("noticeList",noticeList);
        return this.userDirect("position_detail");
    }

    /**
     * 用户中心页
     *
     * @return
     */
    @GetMapping(value = "user/info")
    public String userInfo() {
        return this.userDirect("user_info");
    }

    /**
     * 用户简历页
     * @return
     */
    @GetMapping(value = "user/resume")
    public String userResume() {
        return this.userDirect("user_resume");
    }

    /**
     * 职位申请成功页
     * @return
     */
    @GetMapping(value = "user/success")
    public String applySuccess() {
        return this.userDirect("apply_success");
    }

    /**
     * HR登录
     *
     */
//    @GetMapping(value= "hr/login")

    @GetMapping(value = "contact")
    public String contact() {
        return this.userDirect("contact");
    }

    @GetMapping(value = "news")
    public String news(HttpServletRequest request, HttpSession session) {
        PageInfo<NewsEntity> page=null;
        page=newsService.findByPage(1,20);
        List<NewsEntity> newsList=page.getList();
        request.setAttribute("newsList",newsList);
        return this.userDirect("news");
    }

    /**
     * 新闻详情
     * @param request
     * @param session
     * @return
     */
    @GetMapping(value = "news_detail")
    public String news_detail(HttpServletRequest request, HttpSession session) {
        String id=request.getParameter("id");
        NewsEntity news=newsService.findById(Integer.parseInt(id));
        request.setAttribute("news",news);
        return this.userDirect("news_detail");
    }
}
