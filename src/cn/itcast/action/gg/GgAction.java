package cn.itcast.action.gg;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.Gg;
import cn.itcast.service.GgService;

@Controller @Scope("prototype")
public class GgAction {
	@Resource GgService gs;
	private Gg gbean;
	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Gg getGbean() {
		return gbean;
	}
	public void setGbean(Gg gbean) {
		this.gbean = gbean;
	}
	public String addUI(){
		return "UI";
	}
	public String add(){
		gs.save(gbean);
		return "success";
	}
	public String use(){
		Gg ago=gs.findischeck();
		if(ago!=null)
		{
			ago.setIscheck(0);
			gs.update(ago);
		}
		Gg g=gs.find(id);
		g.setIscheck(1);
		gs.save(g);
		return "success";
	}
	public String update(){
		gbean=gs.find(id);
		return "update";
	}
	public String doupdate(){
		gs.update(gbean);
		return "success";
	}
	public String del(){
		gs.del(id);
		return "success";
	}
}
