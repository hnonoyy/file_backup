package model.vo;

public record Soldier(String sn, String name, int type) {

	public String getSn() {
		return sn;
	}

	public String getName() {
		return name;
	}

	public int getType() {
		return type;
	}
	
}
