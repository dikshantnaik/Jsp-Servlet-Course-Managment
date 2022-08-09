package hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static HibernateUtil instance = new HibernateUtil();


    public static Session getSession() {
//	 SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	Configuration cfg = new Configuration();
	cfg.configure("hibernate.cfg.xml");
	SessionFactory factory = cfg.buildSessionFactory();
	Session session = factory.openSession();
	return session;
    }
}
