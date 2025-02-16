package com.xworkz.gym.repository;


import com.xworkz.gym.dto.TimeSlotDetailsDTO;
import com.xworkz.gym.entity.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminRepository {

  AdminLoginEntity adminlogin(String email);

  boolean save(AdminEnquiryEntity adminEntity);

  //boolean update(AdminEnquiryDTO adminDTO);
  List<AdminEnquiryEntity> getall();

  boolean update(AdminEnquiryEntity moduleEntity);

  boolean register(AdminRegistractionEntity adminRegistractionEntity);

  List<AdminRegistractionEntity> getRegDetails();

  public AdminRegistractionEntity findByEmail(String email);

  int updateUserEnquiryDetails(int enquiryId, String name, String updatedBy, String status, String reason);

  int updateRegisterDetails(int registerId, String name, String packaged, String trainer, double amount, double balance);

  AdminEnquiryEntity EnqdetailsbyId(int id);

  boolean saveEnq(EnqueryViewEntity enqueryViewEntity);

  List<EnqueryViewEntity> enqHistory(int enquiryId);

  boolean saveRegHistory(RegisterViewEntity registerViewEntity);

  List<RegisterViewEntity> getRegHistory(int registerId);

  AdminRegistractionEntity userlogin(String email);

  boolean update(AdminRegistractionEntity entity);

  AdminRegistractionEntity resetPassword(String email);

  AdminRegistractionEntity forgotPassword(String email);

  Long getcountName(String name);

  Long getCountPhoneNumber(long phoneNumber);

  Long getRegcountName(String name);

  Long getRegCountEmail(String email);

  AdminRegistractionEntity findById(int id);

  // Long getRegCountPhoneNumber(long phoneNumber);
  AdminRegistractionEntity getUserDetailsById(int id);
  boolean saveTimeSlots(TimeSlotDetailsEntity timeSlotDetailsEntity);

  List<TimeSlotDetailsEntity> getTimeSlot();
  boolean saveTrainerDetails(TrainerDetailsEntity trainerDetailsEntity);

  List<TrainerDetailsEntity> getTrainerDetails();
  AdminRegistractionEntity searchDetails(String name,String email);

  List<AdminRegistractionEntity> assignSlot();

  boolean deteteById(int id);
  boolean updateSlot(int entityId, int trainerId);
  TrainerDetailsEntity getDetailsById(int id);




}
