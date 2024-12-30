package com.xworkz.commonmodule.service;

import com.xworkz.commonmodule.dto.ModuleDTO;
import com.xworkz.commonmodule.entity.AbstractAdutEntity;

import com.xworkz.commonmodule.entity.ModuleEntity;
import com.xworkz.commonmodule.repository.ModuleRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

@Service
public class ModuleServiceImplementation implements ModuleService {


    private static final Logger log = LoggerFactory.getLogger(ModuleServiceImplementation.class);
    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    ModuleRepository moduleRepository;

    @Override
    public boolean save(ModuleDTO moduleDTO) {
        log.info("running service implementation");




        String password = generateRandomPassword();
        String encodedPassword =passwordEncoder.encode(password) ;


        ModuleEntity moduleEntity = new ModuleEntity();
        moduleEntity.setId(moduleDTO.getId());
        moduleEntity.setName(moduleDTO.getName());
        moduleEntity.setEmail(moduleDTO.getEmail());
        moduleEntity.setAlternativeEmail(moduleDTO.getAlternativeEmail());
        moduleEntity.setPhoneNumber(moduleDTO.getPhoneNumber());
        moduleEntity.setAlternativePhoneNumber(moduleDTO.getAlternativePhoneNumber());
        moduleEntity.setLocation(moduleDTO.getLocation());
        moduleEntity.setPassword(password);

        moduleEntity.setCreatedBy(moduleDTO.getName());
        moduleEntity.setUpdatedBy(moduleDTO.getName());
        moduleEntity.getCreateDate();
        moduleEntity.getUpdatedDate();



        moduleEntity.setLoginCount(-1);
        if(moduleDTO.getEmail()!=null)
        {
            saveEmail(moduleDTO.getEmail(),password);
        }

        boolean saved = moduleRepository.save(moduleEntity);
        log.info("deatils" + moduleEntity);

        return saved;

    }


    public static String generateRandomPassword() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < 8; i++) {
            int randomIndex = random.nextInt(characters.length());
            password.append(characters.charAt(randomIndex));
        }


        return password.toString();
    }





    @Override
    public Long getcountName(String name) {
        log.info("the name is.."+name);
        Long getname = moduleRepository.getcountName(name);
        log.info("getting from repo is..+"+getname);

        return getname;


    }

    @Override
    public Long getcountemail(String email) {
        Long getemail = moduleRepository.getcountName(email);
        return getemail;
    }

    @Override
    public Long getcountaltEmail(String alternativeEmail) {

        Long getaltemail = moduleRepository.getcountaltEmail(alternativeEmail);

        return getaltemail;
    }

    @Override
    public Long getcountNumber(String phoneNumber) {
        Long getnumber = moduleRepository.getcountNumber(phoneNumber);
        return getnumber;
    }

    @Override
    public Long getcountalternumber(String alternativePhoneNumber) {
        Long getaltNumber = moduleRepository.getcountalternumber(alternativePhoneNumber);
        return getaltNumber;
    }

    @Override
    public ModuleEntity login(String email, String password) {
        ModuleEntity entity=moduleRepository.login(email,password);
        System.out.println("--------------"+entity);
        if (entity.getLoginCount() <= 3) {


            log.info("Account locked for email: " + email);
        }

        if (entity.getPassword().equals(password)) {
            entity.setLoginCount(0);
            moduleRepository.update(entity);

            return entity;
        } else {
            int updatedCount = entity.getLoginCount() + 1;
            if (updatedCount > 3) {
                updatedCount = 3; // Ensure count does not exceed 3
            }
            entity.setLoginCount(updatedCount);
            moduleRepository.update(entity);
            log.info("//////////////"+entity);
            return  entity;

        }
    }


    @Override
    public boolean resetPassword(String email, String newPassword, String conformPassword) {
        log.info("printing email"+email);
        ModuleEntity entity = moduleRepository.findByEmail(email);
        log.info("printing entity"+entity);
        if (entity != null)
    {
            if (entity.getPassword().equals(newPassword)){
                String encryptedPassword = passwordEncoder.encode(newPassword);

                entity.setPassword(encryptedPassword);
                entity.setLoginCount(0);

                return moduleRepository.update(entity);
            }
        }
        return false;
    }

    @Override
    public boolean saveEmail(String email, String password)
    {

        final String username ="renuka.xworkz@gmail.com";
        final String userPassword = "qzfb jarx tvqw fuir";
        log.info("email and password is running");

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
       prop.put("mail.smtp.auth", "true");
       prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop,
              new javax.mail.Authenticator() {
                   protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, userPassword);
                   }
                });
        try {

            Message message = new MimeMessage(session);
           message.setFrom(new InternetAddress(username));
          message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
           message.setSubject("Your password");
           message.setText("your passwordd:"+password);

           Transport.send(message);
            log.info("Email sent successfully.");

            log.info("Done");

        } catch (MessagingException e) {

            log.info("Failed to send email: " + e.getMessage());
            e.printStackTrace();
       }

        return true;
    }


}




























