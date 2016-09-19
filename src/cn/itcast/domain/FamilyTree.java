package cn.itcast.domain;

import org.dom4j.Text;

public class FamilyTree {
	private Integer id;
	private Text tree;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Text getTree() {
		return tree;
	}
	public void setTree(Text tree) {
		this.tree = tree;
	}
}
