package com.xworkz.gym.service;


import com.xworkz.gym.dto.*;
import com.xworkz.gym.entity.*;
import com.xworkz.gym.repository.AdminRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.time.LocalTime;
import java.util.*;


@Service
public class AdminServiceImplementation implements AdminService {


    private static final Logger log = LoggerFactory.getLogger(AdminServiceImplementation.class);
    @Autowired
    AdminRepository adminRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public boolean adminlogin(String email, String password) {
        System.out.println("printing in service...");
        AdminLoginEntity adminEntity = adminRepository.adminlogin(email);
        System.out.println("to know the value coming from repository....." + adminEntity);
        if (adminEntity != null) {
            // Debugging logs to verify the retrieved entity
            System.out.println("in if condition..AdminEntity retrieved: " + adminEntity);

            // Compare the entered password with the stored password (assumes the password is stored in plain text, or you may want to hash it before storing)
            if (adminEntity.getPassword().equals(password)) {
                System.out.println("Password matches, login successful.");
                return true; // Return true to indicate success
            } else {
                System.out.println("Password mismatch for email: " + email);
                return false; // Return false if the password does not match
            }
        } else {
            System.out.println("No matching entity found for email: " + email);
            return false; // Return false if no entity is found for the email
        }
    }


    @Override
    public boolean save(AdminEnquiryDTO adminDTO) {


        AdminEnquiryEntity adminEntity = new AdminEnquiryEntity();


        adminEntity.setId(adminDTO.getId());
        adminEntity.setName(adminDTO.getName());
        adminEntity.setArea(adminDTO.getArea());
        adminEntity.setPhoneNumber(adminDTO.getPhoneNumber());
        adminEntity.setDistance(adminDTO.getDistance());
        adminEntity.setAge(adminDTO.getAge());
        adminEntity.setStatus(adminDTO.getStatus());
        adminEntity.setReason(adminDTO.getReason());
        adminEntity.setUpdatedBy(adminDTO.getName());
        adminEntity.getCreateDate();
        adminEntity.getUpdatedDate();

        boolean saved = adminRepository.save(adminEntity);
        return true;
    }

    @Override
    public List<AdminEnquiryEntity> getall() {
        System.out.println("getAll request to service");
        List<AdminEnquiryEntity> read = adminRepository.getall();
        return read;

    }


    @Override
    public boolean updateStatus(AdminEnquiryDTO adminEnquiryDTO, String status) {

        System.out.println("Status update request received...");

        AdminEnquiryEntity existingEntity = new AdminEnquiryEntity();

        existingEntity.setStatus(adminEnquiryDTO.getStatus());


        // Save the updated entity back to the database
        boolean updated = adminRepository.update(existingEntity);
        if (updated) {
            System.out.println("Status updated successfully.");
            return true;
        } else {
            System.out.println("Failed to update the status in the database.");
            return false;
        }
    }

    @Override
    public boolean register(AdminRegistrationDTO adminRegistrationDTO) {

        System.out.println("register requesting in service ");


        String password = generateRandomPassword();
        String encoderpassword = passwordEncoder.encode(password);

        AdminRegistractionEntity adminRegistractionEntity = new AdminRegistractionEntity();
        adminRegistractionEntity.setId(adminRegistrationDTO.getId());
        adminRegistractionEntity.setName(adminRegistrationDTO.getName());
        adminRegistractionEntity.setEmail(adminRegistrationDTO.getEmail());
        adminRegistractionEntity.setGymName(adminRegistrationDTO.getGymName());
        adminRegistractionEntity.setTrainer(adminRegistrationDTO.getTrainer());
        adminRegistractionEntity.setPackaged(adminRegistrationDTO.getPackaged());
        adminRegistractionEntity.setDiscount(adminRegistrationDTO.getDiscount());
        adminRegistractionEntity.setAmount(adminRegistrationDTO.getAmount());
        adminRegistractionEntity.setDiscount(adminRegistrationDTO.getDiscount());
        adminRegistractionEntity.setAmount(adminRegistrationDTO.getAmount());
        adminRegistractionEntity.setAmountPaid((long) adminRegistrationDTO.getAmountPaid());
        adminRegistractionEntity.setBalance(adminRegistrationDTO.getBalance());
        adminRegistractionEntity.setInstalment(adminRegistrationDTO.getInstalment());
        adminRegistractionEntity.setAge(adminRegistrationDTO.getAge());
        adminRegistractionEntity.setGender(adminRegistrationDTO.getGender());
        adminRegistractionEntity.setHeight(adminRegistrationDTO.getHeight());
        adminRegistractionEntity.setWeight(adminRegistrationDTO.getWeight());

        adminRegistractionEntity.setPassword(password);
        adminRegistractionEntity.setLoginCount(-1);


        boolean saved = adminRepository.register(adminRegistractionEntity);

        if (saved) {
            return saveEmail(adminRegistrationDTO.getEmail(), password);
        }

        System.out.println("register saving in the service");
        return true;
    }


    public static String generateRandomPassword() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder password = new StringBuilder();

        // Generate a 4-character random password
        for (int i = 0; i < 4; i++) {
            int randomIndex = random.nextInt(characters.length());
            password.append(characters.charAt(randomIndex));
        }

        return password.toString();
    }


    @Override
    public List<AdminRegistrationDTO> getRegDetails() {

        System.out.println("getReg request to service");
        List<AdminRegistractionEntity> read = adminRepository.getRegDetails();
        List<AdminRegistrationDTO> listOfdto = new ArrayList<>();

        read.forEach(y -> {
            AdminRegistrationDTO dto = new AdminRegistrationDTO();
            BeanUtils.copyProperties(y, dto);
            listOfdto.add(dto);
        });


        if (listOfdto != null) {
            System.out.println("data is returning from repository");
            return listOfdto;
        } else {

            System.out.println("data is not returning from repository");

            return Collections.emptyList();
        }
    }

    @Override
    public int updateUserEnquiryDetails(int enquiryId, String name, String updatedBy, String status, String reason, EnqueryViewDTO enqueryViewDTO) {

        log.info("update status in service");
        int updatedValue = adminRepository.updateUserEnquiryDetails(enquiryId, name, updatedBy, status, reason);
        saveEnq(enqueryViewDTO, enquiryId);
        return updatedValue;
    }

    @Override
    public int updateRegisterDetails(int registerId, String name, String packaged, String trainer, double amount, double balance) {

        int updatedeDetails = adminRepository.updateRegisterDetails(registerId, name, packaged, trainer, amount, balance);
        return updatedeDetails;
    }

    @Override
    public boolean saveEmail(String email, String password) {

        final String username = "renuka.xworkz@gmail.com";
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
            message.setText("your passwordd:" + password);

            Transport.send(message);
            log.info("Email sent successfully.");

            log.info("Done");

        } catch (MessagingException e) {

            log.info("Failed to send email: " + e.getMessage());
            e.printStackTrace();
        }

        return true;
    }

    @Override
    public AdminEnquiryEntity EnqdetailsbyId(int id) {

        log.info("update enquiry is requesting to service");
        AdminEnquiryEntity adminEnquiryEntity = adminRepository.EnqdetailsbyId(id);

        if (adminEnquiryEntity != null) {
            return adminEnquiryEntity;
        } else {
            return null;
        }
    }

    @Override
    public boolean saveEnq(EnqueryViewDTO enqueryViewDTO, int id) {

        log.info("saveEnq deatils in service");

        EnqueryViewEntity enqueryViewEntity = new EnqueryViewEntity();

        enqueryViewEntity.setId(enqueryViewDTO.getId());
        enqueryViewEntity.setEnquiryId(enqueryViewDTO.getEnquiryId());
        enqueryViewEntity.setName(enqueryViewDTO.getName());
        enqueryViewEntity.setStatus(enqueryViewDTO.getStatus());
        enqueryViewEntity.setReason(enqueryViewDTO.getReason());
        enqueryViewEntity.setUpdatedBy(enqueryViewDTO.getName());
        enqueryViewEntity.getUpdatedDate();
        enqueryViewEntity.getCreateDate();

        boolean saved = adminRepository.saveEnq(enqueryViewEntity);

        return true;
    }

    @Override
    public List<EnqueryViewEntity> enqHistory(int enquiryId) {

        log.info("requesting view page in service");


        List<EnqueryViewEntity> read = adminRepository.enqHistory(enquiryId);
        return read;
    }

    @Override
    public boolean saveRegHistory(RegisterViewDTO registerViewDTO) {

        RegisterViewEntity registerViewEntity = new RegisterViewEntity();
        registerViewEntity.setId(registerViewDTO.getId());
        registerViewEntity.setRegisterId(registerViewDTO.getRegisterId());
        registerViewEntity.setPackaged(registerViewDTO.getPackaged());
        registerViewEntity.setUpdatedBy(registerViewDTO.getName());
        registerViewEntity.setTrainer(registerViewDTO.getTrainer());
        registerViewEntity.setInstalment(registerViewDTO.getInstalment());
        registerViewEntity.setAmount(registerViewDTO.getAmount());
        registerViewEntity.setAmountPaid(registerViewDTO.getAmountPaid());
        registerViewEntity.setBalance(registerViewDTO.getBalance());
        registerViewEntity.setUpdatedBy(registerViewDTO.getName());

        registerViewEntity.getUpdatedDate();
        registerViewEntity.getCreateDate();
        boolean saved = adminRepository.saveRegHistory(registerViewEntity);
        return true;
    }

    @Override
    public List<RegisterViewEntity> getRegHistory(int registerId) {
        List<RegisterViewEntity> data = adminRepository.getRegHistory(registerId);
        return data;

    }

    @Override
    public AdminRegistractionEntity userlogin(String email, String password) {

        log.info("User details in the service");
        AdminRegistractionEntity entity = adminRepository.userlogin(email);

        log.info("User entity is returning in service");

        if (entity != null) {
            // If the login count is 3 or more, treat the account as locked and return null
            if (entity.getLoginCount() >= 3) {
                log.warn("Account is locked due to 3 failed login attempts.");
                return null;  // Return null if account is locked (login attempts reached 3)
            }

            // Check if the password matches
            if (entity.getPassword().equals(password)) {
                // Reset login count to 0 if login is successful
                entity.setLoginCount(0);

                // Save the entity with updated login count
                boolean saved = adminRepository.update(entity);

                return entity;
            } else {
                // Increment login attempt count
                int newLoginCount = entity.getLoginCount() + 1;
                entity.setLoginCount(newLoginCount);

                // If login count reaches 3, lock the account by just checking the login count
                if (newLoginCount >= 3) {
                    log.warn("Account is locked due to 3 failed login attempts.");
                }

                // Save the updated entity with incremented login count or locked status
                adminRepository.update(entity);
            }
        }

        return null;
    }

    public boolean resetPassword(String email, String newPassword, String confirmPassword) {
        log.info("printing email" + email);
        AdminRegistractionEntity entity = adminRepository.resetPassword(email);
        log.info("printing entity" + entity);

        if (entity != null) {
            // Check if the new password matches the confirm password
            if (newPassword.equals(confirmPassword)) {
                log.info("new password matches confirm password");

                // Encrypt the new password
                String encryptedPassword = passwordEncoder.encode(newPassword);

                // Set the encrypted password
                entity.setPassword(encryptedPassword);
                entity.setLoginCount(0); // Reset login count

                // Update the entity
                return adminRepository.update(entity);  // This method should persist the updated entity
            } else {
                log.warn("New password does not match confirm password");
            }
        }
        return false;  // Return false if the entity was not found or passwords don't match
    }

    //    @Override
//    public boolean forgotPassword(String email, String password) {
//        return false;
//    }
    @Override
    public Long getcountName(String name) {
        log.info("count name in service");
        log.info("the name is.." + name);
        Long getname = adminRepository.getcountName(name);
        log.info("getting from repo is..+" + getname);

        return getname;


    }

    @Override
    public Long getPhoneNumber(long phoneNumber) {
        log.info("count phoneNumber in service");

        Long count = adminRepository.getCountPhoneNumber(phoneNumber);
        log.info("getting phone number service in " + count);
        return count;
    }

    @Override
    public Long getRegcountName(String name) {

        Long count = adminRepository.getRegcountName(name);
        return count;
    }

    @Override
    public Long getRegCountEmail(String email) {
        Long count = adminRepository.getRegCountEmail(email);
        return count;
    }

    @Override
    public boolean updateUserDetails1(int id, String name, String trainer, String packaged, double amount, double amountPaid, double balance, String filePath) {
        log.info("Updating user details in service");

        // Fetch the user by ID
        AdminRegistractionEntity entity = adminRepository.findById(id);

        if (entity != null) {
            // Update the fields with the provided values
            entity.setName(name);
            entity.setTrainer(trainer);
            entity.setPackaged(packaged);
            entity.setAmountPaid((long) amountPaid);  // Assuming amountPaid is stored as a String in DB
            entity.setBalance(balance);

            // Set the profile image path
            if (filePath != null && !filePath.isEmpty()) {
                entity.setFilePath(filePath);// Assuming you have a field `profileImage` in the entity for storing image path
            }

            // Update the entity in the database
            return adminRepository.update(entity);
        }
        return true; // If entity not found, return false
    }

    @Override
    public AdminRegistractionEntity updateUserDetails(int id) {

        log.info("profile photo is in service");

        AdminRegistractionEntity entity = adminRepository.findById(id);


        return entity;
    }

    @Override
    public boolean updatePhoto(AdminRegistrationDTO dto, String filePath) {
        log.info("update profile photo in service");
        AdminRegistractionEntity entity = adminRepository.getUserDetailsById(dto.getId());
        boolean saved = adminRepository.update(entity);
        return true;
    }

    @Override
    public boolean saveTimeSlots(TimeSlotDetailsDTO timeSlotDetailsDTO) {

        TimeSlotDetailsEntity timeSlotEntity = new TimeSlotDetailsEntity();
        timeSlotEntity.setId(timeSlotDetailsDTO.getId());
        timeSlotEntity.setStartTime(timeSlotDetailsDTO.getStartTime());
        timeSlotEntity.setEndTime(timeSlotDetailsDTO.getEndTime());
        timeSlotEntity.setDuration(timeSlotDetailsDTO.getDuration());

        log.info("timeSlotEntity" + timeSlotEntity);

        boolean saved = adminRepository.saveTimeSlots(timeSlotEntity);

        return true;
    }

    @Override
    public List<TimeSlotDetailsEntity> getTimeSlot() {

        List<TimeSlotDetailsEntity> retrive = adminRepository.getTimeSlot();
        return retrive;
    }

    @Override
    public boolean saveTrainerDetails(TrainerDetailsDTO trainerDetailsDTO) {

        TrainerDetailsEntity trainerDetailsEntity = new TrainerDetailsEntity();
        trainerDetailsEntity.setId(trainerDetailsDTO.getId());
        trainerDetailsEntity.setTrainer(trainerDetailsDTO.getTrainer());
        trainerDetailsEntity.setPhoneNumber(trainerDetailsDTO.getPhoneNumber());
        trainerDetailsEntity.setSlotTimings(trainerDetailsDTO.getSlotTimings());
        boolean saved = adminRepository.saveTrainerDetails(trainerDetailsEntity);
        return true;
    }

    @Override
    public List<TrainerDetailsEntity> getTrainerDetails() {

        List<TrainerDetailsEntity> retrive = adminRepository.getTrainerDetails();
        return retrive;
    }

    @Override
    public AdminRegistractionEntity searchDetails(String name, String email) {

        log.info("search in service");

        AdminRegistractionEntity entity = adminRepository.searchDetails(name, email);
        return entity;
    }

    @Override
    public List<AdminRegistractionEntity> assignSlot() {

        List<AdminRegistractionEntity> retrive = adminRepository.assignSlot();
        return retrive;
    }

    @Override
    public boolean deteteById(int id) {

        log.info("delete query is running");

        boolean deleted = adminRepository.deteteById(id);
        if (deleted) {
            return true;

        } else {
            return false;
        }


    }

    @Override
    public boolean updateSlot(int entityId, int trainerId) {
        log.info("assign slot request in service ");
        boolean  updated= adminRepository.updateSlot(entityId, trainerId);
        return true;
    }

    @Override
    public TrainerDetailsEntity getDetailsById(int id) {
        TrainerDetailsEntity entity=adminRepository.getDetailsById(id);
        return entity;
    }


}




//    @Override
//    public Long getRegCountPhoneNumber(long phoneNumber) {
//        Long count=adminRepository.getRegCountPhoneNumber(phoneNumber);
//        return count;
//    }






