package biz.web.action;

import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import biz.entity.Qu;
import biz.entity.QuItem;
import biz.entity.QuScore;
import biz.entity.main.News;
import biz.entity.main.Personality;
import biz.entity.main.Ques;
import biz.entity.main.QuesItem;
import biz.entity.main.QuesType;
import biz.entity.main.SimpleUser;
import biz.entity.main.Transform;
import biz.entity.main.User;
import biz.entity.main.UserResult;
import biz.web.service.impl.BizService;
import util.Constant;
import util.DateUtil;
import util.FieldUtil;
import util.MD5;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;

@Controller
@RequestMapping("/com")
public class WebAction extends BaseAction {
	@Autowired
	private BizService service;

	@RequestMapping(value = "/queryNews.do")
	public String queryNews() {
		try {
			int pageNum = 0;
			String t = request.getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) session.getAttribute(Constant.SESSION_PAGE + "_WEB");
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				//p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER);
				p.setItemsPerPage(100);

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
							parmvalues.add(FieldUtil.format(News.class, name, fieldValue));
						}
					}
				}

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, News.class);

			session.setAttribute(Constant.SESSION_PAGE + "_WEB", page);

			return "forward:/web/listNews.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@RequestMapping(value = "/listQu.do")
	public String listQu() {
		try {
			int pageNum = 0;
			String t = request.getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) session.getAttribute(Constant.SESSION_PAGE + "_WEB");
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				//p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER);
				p.setItemsPerPage(100);

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
							parmvalues.add(FieldUtil.format(Qu.class, name, fieldValue));
						}
					}
				}

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, Qu.class);

			session.setAttribute(Constant.SESSION_PAGE + "_WEB", page);

			return "forward:/web/listQu.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@RequestMapping(value = "/getQu.do")
	public String getQu(Integer uid) {
		Qu item = (Qu) service.get(Qu.class, uid);
		putRequestValue("item", item);

		List<QuItem> list = service.queryByHQL("from QuItem where qu.id=?", item.getId());
		putRequestValue("list", list);

		return "forward:/web/detailQu.jsp";
	}

	@RequestMapping(value = "/updateQuScore.do")
	public String updateQuScore(Integer uid) {
		Qu item = (Qu) service.get(Qu.class, uid);
		putRequestValue("item", item);

		List<QuItem> list = service.queryByHQL("from QuItem where qu.id=?", item.getId());

		int score = 0;

		for (QuItem q : list) {
			int score1 = getInt("item_" + q.getId());
			score += score1;
		}
		putRequestValue("score", score);
		List<QuScore> slist = service.queryByHQL("from QuScore where qu.id=? and minscore<=? and maxscore>?", item.getId(), score,
				score);
		if (slist.size() > 0) {
			QuScore s = slist.get(0);
			putRequestValue("scoreItem", s);
		}

		putRequestValue("list", list);

		return "forward:/web/detailQuScore.jsp";
	}

	@RequestMapping(value = "/getNews.do")
	public String getNews(Integer uid) {
		News item = (News) service.get(News.class, uid);
		putRequestValue("item", item);
		return "forward:/web/detailNews.jsp";
	}

	@RequestMapping(value = "/delUserResult.do")
	public String delUserResult(Integer uid) {
		try {
			service.delete(UserResult.class, uid + "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/com/user.do?type=hist";
	}

	private SimpleUser getUser() {
		SimpleUser su = (SimpleUser) session.getAttribute("SimpleUser");
		return su;
	}

	@RequestMapping(value = "/user.do", method = RequestMethod.GET)
	public String touser(String type) {
		SimpleUser su = (SimpleUser) session.getAttribute("SimpleUser");
		if (su == null) {
			return "redirect:/com/index.do";
		}
		if (StringUtil.isEmpty(type)) {
			type = "info";
		}
		if ("note1".equals(type)) {
			List<Ques> list = service.findUserVoteList(su.getId());
			request.setAttribute("mylist", list);
		} else if ("note2".equals(type)) {
			List<QuesType> list = service.findUserQuesList(su.getId());
			request.setAttribute("mylist", list);
		} else if ("hist".equals(type)) {
			List<UserResult> list = service.queryByHQL("from UserResult where user.id=?", su.getId());
			request.setAttribute("mylist", list);
		} else if ("note".equals(type)) {

		}
		request.setAttribute("type", type);
		return "forward:/web/user.jsp";
	}

	@RequestMapping(value = "/userLogin.do", method = RequestMethod.POST)
	@ResponseBody
	public String userLogin(String name, String password, String unsaved) {
		log.info(unsaved);
		String msg = "用户名或者密码错误";
		try {
			MD5 md = new MD5();
			password = md.getMD5ofStr(password);
			SimpleUser user = (SimpleUser) service.findUser(SimpleUser.class.getSimpleName(), name, password);
			if (user != null) {
				session.setAttribute("SimpleUser", user);
				UserResult ur = (UserResult) session.getAttribute("unsavedresult");
				if ("unsaved".equals(unsaved) && ur != null) {
					ur.setUser(user);
					service.addUserResult(ur);
					msg = "跳转";
					session.removeAttribute("unsavedresult");
				} else {
					msg = "成功";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "{\"msg\":\"" + msg + "\"}";
	}

	@RequestMapping(value = "/userReg.do", method = RequestMethod.POST)
	@ResponseBody
	public String userReg(SimpleUser bean) {
		String msg = "";
		try {
			User user = service.findUser(bean.getUser().getUname());
			if (user != null) {
				msg = "注册失败,账号已经被使用";
			} else {
				service.addSimpleUser(bean);
				msg = "成功";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "注册失败";
		}
		return "{\"msg\":\"" + msg + "\"}";
	}

	@RequestMapping(value = "/userPwd.do", method = RequestMethod.POST)
	@ResponseBody
	public String userPwd(String oldpwd, String newpwd) {
		String msg = "";
		try {
			SimpleUser su = (SimpleUser) session.getAttribute("SimpleUser");
			User sessionUser = su.getUser();
			MD5 md = new MD5();
			String password = md.getMD5ofStr(oldpwd);

			SimpleUser temp = (SimpleUser) service.get(SimpleUser.class, su.getId());
			if (!password.equals(temp.getUser().getUserPassword())) {
				msg = "旧密码错误";
			} else {
				sessionUser.setUserPassword(newpwd);
				service.updateSimpleUser(su);
				msg = "成功";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "修改密码失败";
		}
		return "{\"msg\":\"" + msg + "\"}";
	}

	@RequestMapping(value = "/userUpdate.do", method = RequestMethod.POST)
	public String userUpdate(User bean) {
		try {
			SimpleUser su = (SimpleUser) session.getAttribute("SimpleUser");
			User sessionUser = su.getUser();

			bean.setUserId(sessionUser.getUserId());
			bean.setUname(sessionUser.getUname());
			if (StringUtil.notEmpty(bean.getUserPassword())) {
				MD5 md = new MD5();
				String password = md.getMD5ofStr(bean.getUserPassword());
				bean.setUserPassword(password);
			} else {
				bean.setUserPassword(sessionUser.getUserPassword());
			}
			service.update(bean);

			sessionUser.setUserAddress(bean.getUserAddress());
			sessionUser.setUserBirth(bean.getUserBirth());
			sessionUser.setUserEmail(bean.getUserEmail());
			sessionUser.setUserGender(bean.getUserGender());
			sessionUser.setUserName(bean.getUserName());
			sessionUser.setUserPhone(bean.getUserPhone());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/com/user.do?type=info";
	}

	@RequestMapping(value = "/userLogout.do", method = RequestMethod.GET)
	public String userLogout() {
		session.invalidate();
		return "redirect:/exit.jsp";
	}

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index() {
		return "forward:/web/index.jsp";
	}

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Integer type) {
		return "forward:/web/list.jsp";
	}

	@RequestMapping(value = "/getVote.do")
	public String getVote(int uid) {
		Ques item = service.getQues(uid);
		request.setAttribute("item", item);
		return "forward:/web/detailVote.jsp";
	}

	@RequestMapping(value = "/getUserVote.do")
	public String getUserVote(int uid) {
		Ques item = service.getQues(uid);
		request.setAttribute("item", item);

		List<UserResult> list = service.findUserVoteList(getUser().getId(), item.getId());
		request.setAttribute("userList", list);

		return "forward:/web/detailVoteUser.jsp";
	}

	@RequestMapping(value = "/getUserQues.do")
	public String getUserQues(int uid) {
		QuesType item = service.getQuesType(uid);
		request.setAttribute("item", item);

		List<UserResult> list = service.findUserQuesList(getUser().getId(), item.getId());
		request.setAttribute("userList", list);

		return "forward:/web/detailQuesUser.jsp";
	}

	@RequestMapping(value = "/getQues.do")
	public String getQues() {
		QuesType item = service.getQuesType(0);
		request.setAttribute("item", item);
		return "forward:/web/detailQues.jsp";
	}

	@RequestMapping(value = "/getPersonalityInfo.do")
	public String getPersonalityInfo(int uid) {
		Personality item = (Personality) service.get(Personality.class, uid);
		request.setAttribute("item", item);
		return "forward:/web/detailInfo.jsp";
	}

	@RequestMapping(value = "/updateQuesCheck.do")
	public String updateQuesCheck(int uid) {
		SimpleUser user = getUser();
		String message = null;

		QuesType quesType = service.getQuesType(uid);
		List<Ques> quesList = quesType.getQuesList();

		UserResult ur = new UserResult();
		int score = 0;
		for (Ques ques : quesList) {
			String[] values = null;
			if (ques.getCheckType().equals("多选")) {
				values = request.getParameterValues("item_" + ques.getId());
			} else {
				String tempv = request.getParameter("item_" + ques.getId());
				if (StringUtils.isNotBlank(tempv)) {
					values = new String[1];
					values[0] = tempv;
				}
			}
			if (values == null || values.length == 0) {
				message = "请完成所有问卷回答";
				session.setAttribute("VoteErrorMessage", message);
				return "redirect:/com/getQues.do?uid=" + uid;
			}

			for (String va : values) {
				int id = Integer.valueOf(va);
				QuesItem qi = (QuesItem) service.get(QuesItem.class, id);
				score += qi.getScore();
			}
		}
		ur.setAddDate(DateUtil.getCurrentTime());
		ur.setScore(score);

		if (user == null) {
			message = "请先登录后查看结果";
			session.setAttribute("unsavedresult", ur);
			session.setAttribute("VoteErrorMessage", message);
			return "redirect:/com/getQues.do?uid=" + uid;
		} else {
			ur.setUser(user);
			service.addUserResult(ur);
			return "redirect:/com/updateQuesCheckAfter.do?uid=" + uid;
		}
	}

	@RequestMapping(value = "/updateQuesCheckAfter.do")
	public String updateQuesCheckAfter() {
		return "forward:/web/detailQuesResult.jsp";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/showResult.do")
	public String showResult() {
		SimpleUser user = getUser();
		String message = null;
		if (user == null) {
			message = "请先登录后操作";
			session.setAttribute("VoteErrorMessage", message);
			return "redirect:/web/userResult.jsp";
		}
		List<UserResult> list = service.queryByHQL("from UserResult where user.id=? order by id desc", user.getId());
		if (list.size() > 0) {
			UserResult current = list.get(0);
			request.setAttribute("currentResult", current);
			if (list.size() > 1) {
				UserResult pre = list.get(1);
				Transform trans = service.getTransfrom(pre.getPersonality().getId(), current.getPersonality().getId());

				request.setAttribute("preResult", pre);
				request.setAttribute("trans", trans);
			}
		}

		return "forward:/web/userResult.jsp";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getOneResult.do")
	public String getOneResult(int uid) {

		UserResult current = (UserResult) service.get(UserResult.class, uid);
		request.setAttribute("currentResult", current);

		return "forward:/web/getOneResult.jsp";
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/search.do", method = RequestMethod.POST)
	public String search(String type, String key) {
		List list = null;

		return "forward:/web/list.jsp";
	}

}
