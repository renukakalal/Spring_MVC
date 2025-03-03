package com.xworkz.gym.repository;


import com.xworkz.gym.entity.*;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.util.Collections;
import java.util.List;

@Slf4j
@Repository
public class AdminRepositoryImplementation implements AdminRepository {

    @Autowired
    private EntityManagerFactory emf;

    @Override
    public AdminLoginEntity adminlogin(String email) {
        log.info("printing repository...");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            // Create named query and set parameters
            Query query = em.createNamedQuery("getEmail");
            query.setParameter("setEmail", email);

            log.info("Attempting to find entity for email: " + email);
            Object singleResult = query.getSingleResult();
            log.info("getin relult from database.." + singleResult);

            return (AdminLoginEntity) singleResult;
        } catch (Exception e) {
            // Handle case where no result is found
//            if (et.isActive()) {
//                et.rollback();
//            }
//            System.out.println("No entityuuuuuuuuuuuuuuu found for email: " + email);
            log.info("getting exception from the AdminLogin...." + e.getMessage());
            return null;
        } finally {
            em.close();
        }

    }

    @Override
    public boolean save(AdminEnquiryEntity adminEntity) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {

            et.begin();
            em.persist(adminEntity);
            et.commit();

        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }


        } finally {
            em.close();
        }


        return true;
    }


    @Override
    public List<AdminEnquiryEntity> getall() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        log.info("getting all data in repository");


        try {

            Query query = em.createNamedQuery("getAll");
            log.info("returning from database...");
            return query.getResultList();
        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }

        } finally {
            em.close();
        }


        return Collections.emptyList();
    }

    @Override
    public boolean update(AdminEnquiryEntity adminEntity) {
        System.out.println("file path requesting repository");

        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        log.info(("updationg data"));


        try {
            transaction.begin();
            // String me=(String)  entityManager.createNamedQuery("dffer").getSingleResult();
            entityManager.merge(adminEntity);
            transaction.commit();
            log.info(("updationg data..........."));
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public boolean register(AdminRegistractionEntity adminRegistractionEntity) {
        log.info("register requesting  in the repository ");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(adminRegistractionEntity);
            et.commit();
            log.info("register saving into database.....");
        } catch
        (Exception e) {
            et.isActive();
            {
                et.rollback();
            }


        } finally {
            em.close();
        }


        return true;
    }

    @Override
    public List<AdminRegistractionEntity> getRegDetails() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        log.info("Getting registration details from the repository");

        try {

            Query query = em.createNamedQuery("getRegDetails");
            log.info("Returning data from the database...");
            List<AdminRegistractionEntity> result = query.getResultList();
            System.out.println("getRegDetails :" + result);

            return result;

        } catch (Exception e) {
            e.getMessage();

            log.info("Persistence exception occurred: " + e.getMessage());

        } finally {
            {
                em.close();
            }
        }

        return Collections.emptyList();
    }


    @Override
    public AdminRegistractionEntity findByEmail(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            Query query = em.createNamedQuery("findUserEmail");
            query.setParameter("SetEmail", email);
            log.info("emailname" + email);
            //query.setParameter("filePath",filePath);

            Object singleresultlist = query.getSingleResult();
            return (AdminRegistractionEntity) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            em.close();
        }

    }

    @Override
    public int updateUserEnquiryDetails(int enquiryId, String name, String updatedBy, String status, String reason) {

        log.info("update status requesting repository....");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value = 0;
        try {
            et.begin();
            Query query = em.createNamedQuery("updateUserEnquiryDetailsById");
            query.setParameter("getupdatedBy", updatedBy);
            query.setParameter("getStatus", status);
            query.setParameter("getReason", reason);
            query.setParameter("SetName", name);
            query.setParameter("getId", enquiryId).executeUpdate();
            log.info("updating data..........");
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return value;

    }

    @Override
    public int updateRegisterDetails(int registerId, String name, String packaged, String trainer, double amount, double balance) {

        log.info("update status requesting repository....");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value = 0;
        try {
            et.begin();
            Query query = em.createNamedQuery("updateRegisterDetailsById");
            query.setParameter("getId", registerId);
            log.info("updating data1..........");
            query.setParameter("getPackaged", packaged);
            log.info("updating data2..........");
            query.setParameter("getTrainer", trainer);
            log.info("updating data3..........");
            query.setParameter("getBalance", balance);
            log.info("updating data4..........");
            query.setParameter("getAmount", amount);
            log.info("updating data5..........");
            query.setParameter("SetName", name).executeUpdate();
            log.info("saving deatisl in repository");
            et.commit();
            log.info("saving deatisl in repository........");
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return value;

    }

    @Override
    public AdminEnquiryEntity EnqdetailsbyId(int id) {

        log.info("requesting entity to repository");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();

            // Assuming you have a query that expects an "id" parameter
            Query query = em.createNamedQuery("getAllUserDetailsById");
            query.setParameter("SetId", id);

            log.info("returning register data from database...");
            return (AdminEnquiryEntity) query.getSingleResult();

        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            log.error("Error executing query: ", e);  // Log the exception for debugging
            return null;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean saveEnq(EnqueryViewEntity enqueryViewEntity) {
        System.out.println("Inside saveEnq method");
        log.info("saveEnq deatils in repository");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {

            et.begin();
            em.persist(enqueryViewEntity);
            et.commit();

        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }


        } finally {
            em.close();
        }


        return true;
    }


    @Override
    public List<EnqueryViewEntity> enqHistory(int enquiryId) {

        log.info("requesting view page in repository");
        EntityManager em = emf.createEntityManager();
        try {
            Query query = em.createNamedQuery("getEnqHistoryById");
            query.setParameter("Setid", enquiryId);
            return query.getResultList();
        } catch (Exception e) {
            log.error("Error in enqHistory method", e);
            return Collections.emptyList();
        } finally {
            em.close();
        }

    }

    @Override
    public boolean saveRegHistory(RegisterViewEntity registerViewEntity) {
        System.out.println("Inside saveEnq method");
        log.info("saveEnq deatils in repository");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {

            et.begin();
            em.persist(registerViewEntity);
            et.commit();

        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }


        } finally {
            em.close();
        }


        return true;
    }

    @Override
    public List<RegisterViewEntity> getRegHistory(int registerId) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            Query query = em.createNamedQuery("getRegHistoryById");
            query.setParameter("Setid", registerId);
            return query.getResultList();
        } catch (Exception e) {
            log.error("Error in enqHistory method", e);
            return Collections.emptyList();
        } finally {
            em.close();
        }

    }

    @Override
    public AdminRegistractionEntity userlogin(String email) {
        log.info("user details in repository");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();


        try {
            Query query = em.createNamedQuery("findUserEmailAndPassword");
            query.setParameter("SetEmail", email);

            log.info("user entity is returning");
            return (AdminRegistractionEntity) query.getSingleResult();
        } catch (NoResultException e) {
            log.info("returning null");
            return null;  // Return null if no user is found
        } finally {
            em.close();
        }
    }


    @Override
    public boolean update(AdminRegistractionEntity entity) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();


        try {
            log.info("updationg data");
            transaction.begin();
            //String me=(String)  entityManager.createNamedQuery("dffer").getSingleResult();
            entityManager.merge(entity);
            log.info("updationg data....");
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public AdminRegistractionEntity resetPassword(String email) {
        log.info("user details in repository");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            Query query = em.createNamedQuery("findUserEmail");  // Ensure this matches the query name defined in the entity
            query.setParameter("SetEmail", email);

            log.info("user entity is returning");
            return (AdminRegistractionEntity) query.getSingleResult();
        } catch (NoResultException e) {
            log.info("returning null");
            return null;  // Return null if no user is found
        } finally {
            em.close();
        }
    }

    @Override
    public AdminRegistractionEntity forgotPassword(String email) {
        return null;
    }

    @Override
    public Long getcountName(String name) {
        log.info("count name in repository");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        Long count = null;
        try {
            et.begin();
            Query query = em.createNamedQuery("getcountName");
            query.setParameter("SetName", name);
            count = (Long) query.getSingleResult();
            log.info("getting single resulyt.." + count);


            et.commit();


        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }


        } finally {
            em.close();
        }

        return count;


    }

    @Override
    public Long getCountPhoneNumber(long phoneNumber) {
        log.info("count phoneNumber in repository");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        Long count = null;
        try {
            et.begin();
            Query query = em.createNamedQuery("getcountPhoneNumber");
            query.setParameter("SetPhoneNumber", phoneNumber);
            count = (Long) query.getSingleResult();
            log.info("getting phoneNumber single resulyt.." + count);


            et.commit();


        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }


        } finally {
            em.close();
        }

        return count;


    }

    @Override
    public Long getRegcountName(String name) {
        log.info("count name in repository");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        Long count = null;
        try {
            et.begin();
            Query query = em.createNamedQuery("getRegcountName");
            query.setParameter("SetName", name);
            count = (Long) query.getSingleResult();
            log.info("getting single resulyt.." + count);


            et.commit();


        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }


        } finally {
            em.close();
        }

        return count;


    }

    @Override
    public Long getRegCountEmail(String email) {
        log.info("count email in repository");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        Long count = null;
        try {
            et.begin();
            Query query = em.createNamedQuery("getRegcountEmail");
            query.setParameter("SetEmail", email);
            count = (Long) query.getSingleResult();
            log.info("getting single resulyt.." + count);


            et.commit();


        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }


        } finally {
            em.close();
        }

        return count;


    }


    @Override
    public AdminRegistractionEntity findById(int id) {
        log.info("updated details photo is in repository");
        EntityManager entityManager = emf.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getUseDetailsById");
            query.setParameter("setId", id);
            log.info("query is executing");

            return (AdminRegistractionEntity) query.getSingleResult();  // Change the result to List<AdminRegistractionEntity>


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return null;  // Return null if no entity is found
    }

    @Override
    public AdminRegistractionEntity getUserDetailsById(int id) {
        log.info("profile photo is in repository");
        EntityManager entityManager = emf.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getUseDetailsById");
            query.setParameter("setId", id);
            log.info("query is executing");

            return (AdminRegistractionEntity) query.getSingleResult();  // Change the result to List<AdminRegistractionEntity>


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return null;  // Return null if no entity is found
    }

    @Override
    public boolean saveTimeSlots(TimeSlotDetailsEntity timeSlotDetailsEntity) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        log.info("timeSlotEntity" + timeSlotDetailsEntity);

        try {

            et.begin();
            em.persist(timeSlotDetailsEntity);
            et.commit();

        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }


        } finally {
            em.close();
        }


        return true;
    }

    @Override
    public List<TimeSlotDetailsEntity> getTimeSlot() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        log.info("getting all data in repository");


        try {

            Query query = em.createNamedQuery("getTimeSlotEntity");
            log.info("returning from database...");
            return query.getResultList();
        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }

        } finally {
            em.close();
        }


        return Collections.emptyList();
    }

    @Override
    public boolean saveTrainerDetails(TrainerDetailsEntity trainerDetailsEntity) {
        log.info("printing in repository" + trainerDetailsEntity);
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {

            et.begin();
            em.persist(trainerDetailsEntity);
            et.commit();

        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }


        } finally {
            em.close();
        }


        return true;
    }

    @Override
    public List<TrainerDetailsEntity> getTrainerDetails() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        log.info("getting all data in repository");


        try {

            Query query = em.createNamedQuery("getTrainerList");
            log.info("returning from database...");
            return query.getResultList();
        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }

        } finally {
            em.close();
        }


        return Collections.emptyList();
    }

    @Override
    public AdminRegistractionEntity searchDetails(String name, String email) {
        log.info("search in repository");

        EntityManager em = emf.createEntityManager();

        try {
            log.info("query is running");
            Query query = em.createNamedQuery("findByNameAndEmail");
            query.setParameter("SetName", name);
            query.setParameter("SetEmail", email);

            log.info("get name and email.....");

            return (AdminRegistractionEntity) query.getSingleResult();

        } catch (NoResultException e) {
            log.info("No entity found for given name and email.");
            return null;
        } catch (Exception e) {
            log.error("Error fetching entity", e);
            return null;
        } finally {
            em.close();
        }
    }

    @Override
    public List<AdminRegistractionEntity> assignSlot() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        log.info("getting all data in repository");


        try {

            Query query = em.createNamedQuery("assignSlot");
            log.info("returning from database...");
            return query.getResultList();
        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }

        } finally {
            em.close();
        }


        return Collections.emptyList();
    }

    @Override
    public boolean deteteById(int id) {

        log.info("delete query is running in repository");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        log.info("delete query is running in repository");

        try {
            et.begin();
            Query query = em.createNamedQuery("deleteById");
            query.setParameter("SetId", id);
            int rowsDeleted = query.executeUpdate();
            return rowsDeleted > 0;

        } catch (Exception e) {
            log.info("Error deleting trainer slot: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean updateSlot(int entityId, int trainerId) {

        log.info("assign slot request in service ");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        log.info("assign slot request in service... ");
        try {
            et.begin();
            log.info("begin...... ");
            Query query = em.createNamedQuery("updateTrainerId");
            log.info("named query is executing.... ");
            query.setParameter("trainerId", trainerId);
            query.setParameter("entityId", entityId);
            log.info("named query is executing.... ");
            int updatedRows = query.executeUpdate();
            log.info("updating.....");
            et.commit();
            log.info("committing....");
            return updatedRows > 0;
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    @Override
    public TrainerDetailsEntity getDetailsById(int id) {
        EntityManager em = emf.createEntityManager();
        TrainerDetailsEntity trainerDetails = null;

        try {
            Query query = em.createNamedQuery("findByTrainerId");
            query.setParameter("SetId", id);

            trainerDetails = (TrainerDetailsEntity) query.getSingleResult();

        } catch (NoResultException e) {
            System.out.println("No trainer found with ID: " + id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return trainerDetails;
    }

    @Override
    public List<AdminRegistractionEntity> getUserById(String trainer) {
        log.info("trainer id in repository: " + trainer);
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<AdminRegistractionEntity> resultList = null;

        try {
            Query query = em.createNamedQuery("findUserById");
            query.setParameter("SetId", trainer);

            resultList = query.getResultList(); // Store the result in the list
            log.info("Fetched list: " + resultList);
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }

        return resultList; // Return the fetched list instead of null
    }

    @Override
    public boolean saveDietPlan(DietPlanEntity dietPlanEntity) {
        System.out.println("Saving Diet Plan: " + dietPlanEntity);

        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(dietPlanEntity);
            et.commit();
            return true; // Return true only if commit succeeds
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace(); // Print the exception for debugging
            return false; // Indicate failure
        } finally {
            em.close();
        }
    }


    @Override
    public List<DietPlanEntity> getDietPlan(int UserId) {  // Ensure consistent naming
        log.info("Request in repository");
        EntityManager em = emf.createEntityManager();

        try {
            Query query = em.createNamedQuery("findByUserId"); // Ensure NamedQuery exists
            query.setParameter("UserId", UserId);  // Ensure parameter name matches ":userId"

            return query.getResultList();  // Return list of diet plans
        } catch (Exception e) {
            e.printStackTrace();  // Print stack trace for debugging
            return Collections.emptyList();  // Return empty list if exception occurs
        } finally {
            em.close();  // Ensure EntityManager is closed
        }
    }

    @Override
    @Transactional
    public boolean saveChanges(ChangesEntity changesEntity) {
        log.info("Saving changes for user: " + changesEntity.getId());
        log.info("save1........");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        log.info("save execution queries");
        try {
            et.begin();
            log.info("executing in begain");
            em.merge(changesEntity);
            log.info("executing in merge");
            et.commit();
            log.info("executing in commit");
            return true;
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            log.error("Error while saving changes: ", e);
            return false;
        } finally {
            em.close();
        }
    }

    @Override
    public List<ChangesEntity> getChanges(int UserId) {
        log.info("Request in repository");
        EntityManager em = emf.createEntityManager();

        try {
            Query query = em.createNamedQuery("findChangesById"); // Ensure NamedQuery exists
            query.setParameter("UserId", UserId);  // Ensure parameter name matches ":userId"

            return query.getResultList();  // Return list of diet plans
        } catch (Exception e) {
            e.printStackTrace();  // Print stack trace for debugging
            return Collections.emptyList();  // Return empty list if exception occurs
        } finally {
            em.close();  // Ensure EntityManager is closed
        }

    }


}





//    @Override
//    public Long getRegCountPhoneNumber(long phoneNumber) {
//        log.info("count phoneNumber in -repository");
//        EntityManager em = emf.createEntityManager();
//        EntityTransaction et = em.getTransaction();
//
//        Long count = null;
//        try {
//            et.begin();
//            Query query = em.createNamedQuery("getRegcountPhoneNumber");
//            query.setParameter("SetPhoneNumber", phoneNumber);
//            count = (Long) query.getSingleResult();
//            log.info("getting phoneNumber single resulyt.." + count);
//
//
//            et.commit();
//
//
//        } catch (Exception e) {
//            et.isActive();
//            {
//                et.rollback();
//            }
//
//
//        } finally {
//            em.close();
//        }
//
//        return count;
//
//
//    }
//
//}
//















