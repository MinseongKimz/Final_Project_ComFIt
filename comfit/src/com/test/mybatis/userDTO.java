package com.test.mybatis;

public class userDTO
{
	// 회원 리스트 속성
	private String u_id, u_email, u_name, u_nickname, u_joindate
	, u_tel, bancount, u_password, u_profile ,u_address;
	

	// 검색값 / 카테고리값
	private String searchvalue;

	

	// 차단회원 리스트 속성
	private String ban_cate_name, ban_date, ban_end_date, rep_cate_name, ban_rea_detail;

	// 이메일 인증 여부
	private String auth , random;



	public String getSearchvalue()
	{
		return searchvalue;
	}

	public void setSearchvalue(String searchvalue)
	{
		this.searchvalue = searchvalue;
	}
	
    public String getU_id()
	{
		return u_id;
	}

	public void setU_id(String u_id)
	{
		this.u_id = u_id;
	}

	public String getU_email()
	{
		return u_email;
	}

	public void setU_email(String u_email)
	{
		this.u_email = u_email;
	}

	public String getU_name()
	{
		return u_name;
	}

	public void setU_name(String u_name)
	{
		this.u_name = u_name;
	}

	public String getU_nickname()
	{
		return u_nickname;
	}

	public void setU_nickname(String u_nickname)
	{
		this.u_nickname = u_nickname;
	}

	public String getU_joindate()
	{
		return u_joindate;
	}

	public void setU_joindate(String u_joindate)
	{
		this.u_joindate = u_joindate;
	}

	public String getU_tel()
	{
		return u_tel;
	}

	public void setU_tel(String u_tel)
	{
		this.u_tel = u_tel;
	}

	public String getBancount()
	{
		return bancount;
	}

	public void setBancount(String bancount)
	{
		this.bancount = bancount;
	}

	public String getU_password()
	{
		return u_password;
	}

	public void setU_password(String u_password)
	{
		this.u_password = u_password;
	}

	public String getU_profile()
	{
		return u_profile;
	}

	public void setU_profile(String u_profile)
	{
		this.u_profile = u_profile;
	}

	public String getBan_cate_name()
	{
		return ban_cate_name;
	}

	public void setBan_cate_name(String ban_cate_name)
	{
		this.ban_cate_name = ban_cate_name;
	}

	public String getBan_date()
	{
		return ban_date;
	}

	public void setBan_date(String ban_date)
	{
		this.ban_date = ban_date;
	}

	public String getBan_end_date()
	{
		return ban_end_date;
	}

	public void setBan_end_date(String ban_end_date)
	{
		this.ban_end_date = ban_end_date;
	}

	public String getRep_cate_name()
	{
		return rep_cate_name;
	}

	public void setRep_cate_name(String rep_cate_name)
	{
		this.rep_cate_name = rep_cate_name;
	}

	public String getBan_rea_detail()
	{
		return ban_rea_detail;
	}

	public void setBan_rea_detail(String ban_rea_detail)
	{
		this.ban_rea_detail = ban_rea_detail;
	}

	public String getAuth()
	{
		return auth;
	}

	public void setAuth(String auth)
	{
		this.auth = auth;
	}

	public String getRandom()
	{
		return random;
	}

	public void setRandom(String random)
	{
		this.random = random;
	}

	public String getU_address()
	{
		return u_address;
	}

	public void setU_address(String u_address)
	{
		this.u_address = u_address;
	}

}