/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import beans.util.JsfUtil;
import entity.Admin;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import javax.faces.context.FacesContext;
import org.hibernate.validator.constraints.NotEmpty;
import sessions.AdminFacade;

/**
 *
 * @author Masudul Haque
 */
@Named(value = "loginController")
@RequestScoped
public class LoginController {
    @NotEmpty(message = "Username is required.")
    private String userName;
    @NotEmpty(message = "Password is required.")
    private String password;
    @EJB
    private AdminFacade adminFacade;

    public LoginController() {
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String login() {
        Admin admin = null;
//        try {
            admin = adminFacade.findByUserNamePass(userName, password);
//        } catch (Exception e) {
//        }
        if (admin != null) {
            return "/product/List";
        } else {
            JsfUtil.addErrorMessage("Username/Password is incorrect.");
            return null;
        }
    }
}
