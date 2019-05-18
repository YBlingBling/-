package biz.web.action;

import java.util.LinkedList;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.Constant;
import util.DateUtil;
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import biz.entity.main.News;
import biz.web.action.BaseAction;
import biz.web.service.impl.BizService;

@Controller
@RequestMapping("/sys")
public class NewsAction extends BaseAction {
	private String		actionname	= "咨询";
	private String		actionclass	= "News";
	@Autowired
	private BizService	service;

	@RequestMapping(value = "/add2News.do", method = RequestMethod.GET)
	public String add2() {
		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "sys/addNews";
	}

	@RequestMapping(value = "/getNews.do", method = RequestMethod.GET)
	public String get(int uid) {
		try {
			News bean = (News) service.get(News.class, uid);
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "sys/modifyNews";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/deleteNews.do")
	public String delete(String ids) {
		try {
			service.delete(News.class, ids);
			MessageUtil.addRelMessage(request, "操作成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "操作失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/addNews.do")
	public String add(News bean) {
		try {
			String imageFile = FileUtil.uploadFile(getHttpServletRequest(), "imageFile1");
			if (StringUtils.isNotBlank(imageFile)) {
				bean.setImageFile(imageFile);
			}
			bean.setAddDate(DateUtil.getCurrentTime());
			service.add(bean);
			MessageUtil.addMessage(request, "添加成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "添加失败.");
			return ERROR;
		}

	}

	@RequestMapping(value = "/updateNews.do")
	public String update(News bean) {
		try {
			bean.setAddDate(DateUtil.getCurrentTime());
			String imageFile = FileUtil.uploadFile(getHttpServletRequest(), "imageFile1");
			if (StringUtils.isNotBlank(imageFile)) {
				bean.setImageFile(imageFile);
			}
			service.update(bean);
			MessageUtil.addRelMessage(request, "更新成功.", "baseAdd");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/queryNews.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, News.class, parmnames, parmvalues);

			//			if (parmnames.contains("type")) {
			//				actionname1 = (String) parmvalues.get(parmnames.indexOf("type"));
			//			}

			Page page = service.find(p, News.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "sys/listNews";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
