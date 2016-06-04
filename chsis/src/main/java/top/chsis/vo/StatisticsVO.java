package top.chsis.vo;

import java.util.List;

public class StatisticsVO {
	
	private String diseaseUuid;
	
	private String year;
	
	private List<String> diseaseUuids;
	
	
	public StatisticsVO() {}

	public StatisticsVO(String diseaseUuid, String year, List<String> diseaseUuids) {
		this.diseaseUuid = diseaseUuid;
		this.year = year;
		this.diseaseUuids = diseaseUuids;
	}

	public String getDiseaseUuid() {
		return diseaseUuid;
	}

	public void setDiseaseUuid(String diseaseUuid) {
		this.diseaseUuid = diseaseUuid;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public List<String> getDiseaseUuids() {
		return diseaseUuids;
	}

	public void setDiseaseUuids(List<String> diseaseUuids) {
		this.diseaseUuids = diseaseUuids;
	}

	@Override
	public String toString() {
		return "StatisticsVO [" + (diseaseUuid != null ? "diseaseUuid=" + diseaseUuid + ", " : "") + (year != null ? "year=" + year + ", " : "") + (diseaseUuids != null ? "diseaseUuids=" + diseaseUuids : "") + "]";
	}
}
