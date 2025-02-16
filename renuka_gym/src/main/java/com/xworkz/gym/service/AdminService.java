package com.xworkz.gym.service;


import com.xworkz.gym.dto.*;
import com.xworkz.gym.entity.*;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.util.List;

@Service
public interface AdminService {

    boolean adminlogin(String email, String password);
    boolean save(AdminEnquiryDTO adminDTO);
    List<AdminEnquiryEntity> getall();
    boolean updateStatus(AdminEnquiryDTO adminEnquiryDTO,String status);
    boolean register(AdminRegistrationDTO adminRegistrationDTO);
    List<AdminRegistrationDTO> getRegDetails();
    int updateUserEnquiryDetails(int enquiryId,String name,String updatedBy,String status, String reason,EnqueryViewDTO enqueryViewDTO);
    int updateRegisterDetails(int registerId,String name,String packaged,String trainer,double amount,double balance);
    boolean saveEmail(String email, String password);
    AdminEnquiryEntity EnqdetailsbyId(int id);
    boolean saveEnq(EnqueryViewDTO enqueryViewDTO,int id);
    List<EnqueryViewEntity>  enqHistory(int enquiryId);
    boolean saveRegHistory(RegisterViewDTO registerViewDTO);
    List<RegisterViewEntity> getRegHistory(int registerId);
    AdminRegistractionEntity userlogin(String email,String password);
    boolean resetPassword(String email, String newPassword, String conformPassword);
   // boolean forgotPassword(String email,String password);
    Long getcountName(String name);
    Long getPhoneNumber(long phoneNumber);
    Long getRegcountName(String name);
    Long getRegCountEmail(String email);
    public boolean updateUserDetails1(int id, String name, String trainer, String packaged, double amount, double amountPaid, double balance, String filePath) ;

   // Long getRegCountPhoneNumber(long phoneNumber);
//
AdminRegistractionEntity updateUserDetails(int id);

   boolean updatePhoto(AdminRegistrationDTO dto,String filePath);
  boolean saveTimeSlots(TimeSlotDetailsDTO timeSlotDetailsDTO);

  List<TimeSlotDetailsEntity> getTimeSlot();

  boolean saveTrainerDetails(TrainerDetailsDTO trainerDetailsDTO);

    List<TrainerDetailsEntity> getTrainerDetails();

    AdminRegistractionEntity searchDetails(String name,String email);

    List<AdminRegistractionEntity> assignSlot();

    boolean deteteById(int id);
   boolean updateSlot(int entityId, int trainerId);

   TrainerDetailsEntity getDetailsById(int id);
}
