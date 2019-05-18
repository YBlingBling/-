package biz.web.action;

import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.Constant;
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;
import biz.entity.main.Ques;
import biz.entity.main.QuesItem;
import biz.entity.main.QuesType;
import biz.entity.main.VoteType;
import biz.vo.ItemBean;
import biz.web.service.impl.BizService;

@Controller
@RequestMapping("/sys")
public class AQues extends BaseAction {

	@Autowired
	private BizService service;

	@RequestMapping(value = "/add2QuesVote.do", method = RequestMethod.GET)
	public String add2QuesVote() {
		List<?> list = service.findAll(VoteType.class);
		request.setAttribute("list", list);
		return "sys/addQuesVote";
	}

	@RequestMapping(value = "/add2Ques.do", method = RequestMethod.GET)
	public String add2() {
		List<?> list = service.queryByHQL("from QuesType where type='问卷'");
		request.setAttribute("list", list);
		return "sys/addQues";
	}

	@RequestMapping(value = "/deleteQues.do")
	public String delete(String ids) {
		try {
			service.delete(Ques.class, ids);
			MessageUtil.addRelMessage(request, "删除信息成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/deleteQuesItem.do")
	public String deleteQuesItem(String ids) {
		try {
			service.delete(QuesItem.class, ids);
			MessageUtil.addRelMessage(request, "删除选项成功.", "baseAdd");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/addQues.do")
	public String add(Ques bean, ItemBean items) {
		try {
			if (items == null || items.getItems() == null || items.getItems().size() == 0) {
				MessageUtil.addMessage(request, "必须有问卷题目选项.");
				return ERROR;
			}

			List list = service.queryByHQL("from Ques where quesType.id=?", bean.getQuesType().getId());
			if (list.size() >= 9) {
				MessageUtil.addMessage(request, "题目组已经有9道题目,不能继续增加了.");
				return ERROR;
			}

			service.addQues(bean, items.getItems());

			MessageUtil.addMessage(request, "添加成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "添加失败.");
			return ERROR;
		}

	}

	@RequestMapping(value = "/addQuesVote.do")
	public String addQuesVote(Ques bean, ItemBean items) {
		try {
			if (items == null || items.getItems() == null || items.getItems().size() == 0) {
				MessageUtil.addMessage(request, "必须有问卷题目选项.");
				return ERROR;
			}
			service.addQuesVote(bean, items.getItems());

			MessageUtil.addMessage(request, "添加成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "添加失败.");
			return ERROR;
		}

	}

	@RequestMapping(value = "/updateQues.do")
	public String update(Ques bean, ItemBean items) {
		try {
			service.updateQues(bean, items.getItems());
			MessageUtil.addMessage(request, "更新成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/updateQuesVote.do")
	public String updateQuesVote(Ques bean, ItemBean items) {
		try {
			service.updateQuesVote(bean, items.getItems());
			MessageUtil.addMessage(request, "更新成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/queryQues.do")
	public String query() {
		try {
			int pageNum = 0;
			String t = request.getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) session.getAttribute(Constant.SESSION_PAGE);
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = request.getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = request.getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(Ques.class, name, fieldValue));
						}
					}
				}

				parmnames.add("quesType.type");
				parmvalues.add("问卷");

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, Ques.class);

			session.setAttribute(Constant.SESSION_PAGE, page);
			return "sys/listQues";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@RequestMapping(value = "/queryQuesVote.do")
	public String queryQuesVote() {
		try {
			int pageNum = 0;
			String t = request.getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) session.getAttribute(Constant.SESSION_PAGE);
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = request.getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = request.getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(Ques.class, name, fieldValue));
						}
					}
				}

				parmnames.add("quesType.type");
				parmvalues.add("投票");

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, Ques.class);

			session.setAttribute(Constant.SESSION_PAGE, page);
			return "sys/listQuesVote";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@RequestMapping(value = "/getQues.do", method = RequestMethod.GET)
	public String get(int uid) {
		try {
			List<?> list = service.findAll(QuesType.class);
			request.setAttribute("list", list);
			Ques bean = (Ques) service.getQues(uid);
			request.setAttribute("modifybean", bean);
			return "sys/modifyQues";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/getQuesVote.do", method = RequestMethod.GET)
	public String getQuesVote(int uid) {
		try {
			List<?> list = service.findAll(VoteType.class);
			request.setAttribute("list", list);
			Ques bean = (Ques) service.getQues(uid);
			request.setAttribute("modifybean", bean);
			return "sys/modifyQuesVote";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

}
