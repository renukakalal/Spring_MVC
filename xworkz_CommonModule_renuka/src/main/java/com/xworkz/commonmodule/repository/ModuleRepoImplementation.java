package com.xworkz.commonmodule.repository;

import com.xworkz.commonmodule.entity.ModuleEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.List;

@Repository
public class ModuleRepoImplementation implements ModuleRepository {

    private static final Logger log = LoggerFactory.getLogger(ModuleRepoImplementation.class);
    @Autowired
    EntityManagerFactory emf;

    @Override
    public boolean save(ModuleEntity moduleEntity) {
        log.info("running in repository implementation");

        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(moduleEntity);
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
    public Long getcountName(String name) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Query query = em.createNamedQuery("getcountName");
        query.setParameter("SetName", name);
        Long count = (Long) query.getSingleResult();
        log.info("getting single resulyt.." + count);

        try {
            et.begin();


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
    public Long getcountemail(String email) {

        EntityManager em = emf.createEntityManager();

        Long count = 0L;
        try {

            Query query = em.createNamedQuery("getcountemail");
            query.setParameter("SetEmail", email);


            count = (Long) query.getSingleResult();
        } catch (Exception e) {

            e.printStackTrace();  // Log or print for debugging
            count = 0L;  // Default count value in case of failure
        } finally {
            // Close the EntityManager to avoid memory leaks
            em.close();
        }

        return count;
    }

    @Override
    public Long getcountaltEmail(String alternativeEmail) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Query query = em.createNamedQuery("getcountaltEmail");
        query.setParameter("SetAlternativeEmail", alternativeEmail);
        Long count = (Long) query.getSingleResult();

        try {
            et.begin();


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
    public Long getcountNumber(String phoneNumber) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Query query = em.createNamedQuery("getcountNumber");
        query.setParameter("SetphoneNumber", phoneNumber);
        Long count = (Long) query.getSingleResult();
        log.info("getting number single resulyt.." + count);

        try {
            et.begin();


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
    public Long getcountalternumber(String alternativePhoneNumber) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Query query = em.createNamedQuery("getcountalternumber");
        query.setParameter("SetalternativePhoneNumber", alternativePhoneNumber);
        Long count = (Long) query.getSingleResult();
        log.info("getting alternative number  resulyt.." + count);

        try {
            et.begin();


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
    public boolean update(ModuleEntity moduleEntity) {

        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();


        try {
            log.info("updationg data");
            transaction.begin();
            entityManager.merge(moduleEntity);
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
    public ModuleEntity login(String email, String password) {


        EntityManager em = emf.createEntityManager();
        EntityTransaction et=em.getTransaction();

        Query query=em.createNamedQuery("login");
        query.setParameter("setEmail",email);
        ModuleEntity result = (ModuleEntity) query.getSingleResult();
        return result;


    }



    @Override
    public ModuleEntity findByEmail(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et=em.getTransaction();
        try {
            Query query = em.createNamedQuery("findbyemail");
            query.setParameter("emailid", email);
            Object singleResult = query.getSingleResult();
            return (ModuleEntity) singleResult;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            em.close();
        }

    }
}

















