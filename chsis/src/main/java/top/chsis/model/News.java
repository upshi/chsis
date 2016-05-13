package top.chsis.model;

import java.io.Serializable;

public class News implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一条新闻，主键
	private String title;//新闻标题
	private String author;//作者
	private Integer type;//类型：新闻的板块 0医生板块、1系统管理员板块、2医院管理员板块
	private String content;//新闻内容
	private String commitTime;//提交时间
	private String checkTime;//审核时间
	private String publishTime;//发布时间
	private Integer state;//新闻的状态：0已提交、1审核中、2审核通过、3审核不通过
	private String publisherUUID;//发布者
	private Integer publisherType;//发布者类型：0医生、1医院管理员、2系统管理员
	
	public News() {}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}


	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCommitTime() {
		return commitTime;
	}

	public void setCommitTime(String commitTime) {
		this.commitTime = commitTime;
	}

	public String getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}

	public String getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getPublisherUUID() {
		return publisherUUID;
	}

	public void setPublisherUUID(String publisherUUID) {
		this.publisherUUID = publisherUUID;
	}

	public Integer getPublisherType() {
		return publisherType;
	}

	public void setPublisherType(Integer publisherType) {
		this.publisherType = publisherType;
	}

	@Override
	public String toString() {
		return "News [uuid=" + uuid + ", title=" + title + ", author=" + author + ", type=" + type + ", content=" + content + ", commitTime=" + commitTime + ", checkTime=" + checkTime + ", publishTime=" + publishTime + ", state=" + state + ", publisherUUID=" + publisherUUID + ", publisherType=" + publisherType + "]";
	}

}
