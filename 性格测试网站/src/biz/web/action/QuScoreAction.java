package biz.web.action;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.Constant;
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import biz.entity.QuScore;
import biz.web.action.BaseAction;
import biz.web.service.impl.BizService;

@Controller
@RequestMapping("/sys")
public class QuScoreAction extends BaseAction {
	private String		actionname	= "分值结果";
	private String		actionclass	= "QuScore";
	@Autowired
	private BizService	service;

	@RequestMapping(value = "/add2QuScore.do", method = RequestMethod.GET)
	public String add2() {
		putRequestValue("list", service.queryByHQL("from Qu"));

		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "sys/addQuScore";
	}

	@RequestMapping(value = "/getQuScore.do", method = RequestMethod.GET)
	public String get(int uid) {
		try {
			putRequestValue("list", service.queryByHQL("from Qu"));

			QuScore bean = (QuScore) service.get(QuScore.class, uid);
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "sys/modifyQuScore";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/deleteQuScore.do")
	public String delete(String ids) {
		try {
			service.delete(QuScore.class, ids);
			MessageUtil.addRelMessage(request, "操作成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "操作失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/addQuScore.do")
	public String add(QuScore bean) {
		try {
			service.add(bean);
			MessageUtil.addMessage(request, "添加成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "添加失败.");
			return ERROR;
		}

	}

	@RequestMapping(value = "/updateQuScore.do")
	public String update(QuScore bean) {
		try {
			service.update(bean);
			MessageUtil.addRelMessage(request, "更新成功.", "baseAdd");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/queryQuScore.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, QuScore.class, parmnames, parmvalues);

			//			if (parmnames.contains("type")) {
			//				actionname1 = (String) parmvalues.get(parmnames.indexOf("type"));
			//			}

			Page page = service.find(p, QuScore.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "sys/listQuScore";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
