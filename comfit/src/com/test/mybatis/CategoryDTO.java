package com.test.mybatis;

public class CategoryDTO
{
   // 카테고리 이름
   private String category_name;
   private int pd_cate_id;
   

   public int getPd_cate_id()
   {
	   return pd_cate_id;
   }

   public void setPd_cate_id(int pd_cate_id)
   {
	   this.pd_cate_id = pd_cate_id;	
   }


   public String getCategory_name()
   {
      return category_name;
   }

   public void setCategory_name(String category_name)
   {
      this.category_name = category_name;
   }

   
   
   
}