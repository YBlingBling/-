package biz.web.action;

import java.util.LinkedList;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.Constant;
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import biz.entity.Qu;
import biz.web.action.BaseAction;
import biz.web.service.impl.BizService;

@Controller
@RequestMapping("/sys")
public class QuAction extends BaseAction {
	private String		actionname	= "趣味测试";
	private String		actionclass	= "Qu";
	@Autowired
	private BizService	service;

	@RequestMapping(value = "/add2Qu.do", method = RequestMethod.GET)
	public String add2() {
		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "sys/addQu";
	}

	@RequestMapping(value = "/getQu.do", method = RequestMethod.GET)
	public String get(int uid) {
		try {
			Qu bean = (Qu) service.get(Qu.class, uid);
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "sys/modifyQu";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/deleteQu.do")
	public String delete(String ids) {
		try {
			service.delete(Qu.class, ids);
			MessageUtil.addRelMessage(request, "操作成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "操作失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/addQu.do")
	public String add(Qu bean) {
		try {
			String imgFile = FileUtil.uploadFile(getHttpServletRequest(), "resfile1");
			if (StringUtils.isNotBlank(imgFile)) {
				bean.setImgFile(imgFile);
			}
			service.add(bean);
			MessageUtil.addMessage(request, "添加成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "添加失败.");
			return ERROR;
		}

	}

	@RequestMapping(value = "/updateQu.do")
	public String update(Qu bean) {
		try {
			String imgFile = FileUtil.uploadFile(getHttpServletRequest(), "resfile1");
			if (StringUtils.isNotBlank(imgFile)) {
				bean.setImgFile(imgFile);
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

	@RequestMapping(value = "/queryQu.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, Qu.class, parmnames, parmvalues);

			//			if (parmnames.contains("type")) {
			//				actionname1 = (String) parmvalues.get(parmnames.indexOf("type"));
			//			}

			Page page = service.find(p, Qu.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "sys/listQu";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
