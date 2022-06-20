package com.test.mybatis;


import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.util.SignDAO;

@Controller
public class SignController
{


   @Autowired
   private SqlSession sqlSession;
   @Autowired
   private JavaMailSender mailSender;

   @RequestMapping(value = "/nicknamecheck.action", method = RequestMethod.POST)
   public String nickNameCheck(Model model, String nickName)
   {
      String result = null;

      IUserLoginDAO dao = sqlSession.getMapper(IUserLoginDAO.class);

      int nickCheck = dao.nickCheck(nickName);
      System.out.println(nickCheck);
      model.addAttribute("nickCheck", nickCheck);

      result = "/WEB-INF/view/user/main/user_nickCheck_ok.jsp";

      return result;
   }

   @RequestMapping(value = "/emailcheck.action", method = RequestMethod.POST)
   public String checkEmail(Model model, String email)
   {
      String result = null;

      IUserLoginDAO dao = sqlSession.getMapper(IUserLoginDAO.class);

      int emailCheck = dao.emailCheck(email);
      model.addAttribute("nickCheck", emailCheck); // 닉체크쓰던곳 걍 똫깥이 쓰겟음

      result = "/WEB-INF/view/user/main/user_nickCheck_ok.jsp";

      return result;
   }

   @RequestMapping(value = "/regit.action", method = RequestMethod.POST)
   public String addUser(Model model, userDTO dto, @RequestParam("address2") String address2,
         @RequestParam("address") String address, @RequestParam("email") String email,
         @RequestParam("name") String name, @RequestParam("nickname") String nickname,
         @RequestParam("tel") String tel, @RequestParam("password") String password)
   {


      String add = address + " " + address2;

      dto.setU_address(add);
      dto.setU_name(name);
      dto.setU_email(email);
      dto.setU_nickname(nickname);
      dto.setU_password(password);
      dto.setU_tel(tel);
      
      MailAuthKey mak = new MailAuthKey();
      String random = mak.random();
      
      dto.setRandom(random);
      
      try
      {
    	  SignDAO dao = new SignDAO();
    	  dao.singUser(dto);
    	  
    	  // 이메일 발송하기
          String from  = "minseonkimc@gmail.com";
          String to  = email;
          String subject = "[Comfit] 이메일 인증 메일입니다.";
          String content = "<a href='http://localhost:8090/comfit/correct.action?auth=" +random +"'>COMFIT인증하러가기</a>";
          
           MimeMessage mail = mailSender.createMimeMessage(); MimeMessageHelper
           mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
           
           mailHelper.setFrom(from); mailHelper.setTo(to);
           mailHelper.setSubject(subject); mailHelper.setText(content, true);
           
           mailSender.send(mail);
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      return "redirect:comfit.action";     

   }


}