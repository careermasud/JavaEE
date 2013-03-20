/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Masudul Haque
 */
@Entity
@Table(name = "admin", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"user_name"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Admin.findAll", query = "SELECT a FROM Admin a"),
    @NamedQuery(name = "Admin.findById", query = "SELECT a FROM Admin a WHERE a.id = :id"),
    @NamedQuery(name = "Admin.findByUserName", query = "SELECT a FROM Admin a WHERE a.userName = :userName"),
    @NamedQuery(name = "Admin.findByUserNamePassword", query = "SELECT a FROM Admin a WHERE a.userName = :userName AND a.password= :password"),
    @NamedQuery(name = "Admin.findByPassword", query = "SELECT a FROM Admin a WHERE a.password = :password"),
    @NamedQuery(name = "Admin.findByRole", query = "SELECT a FROM Admin a WHERE a.role = :role"),
    @NamedQuery(name = "Admin.findByFirstName", query = "SELECT a FROM Admin a WHERE a.firstName = :firstName"),
    @NamedQuery(name = "Admin.findByLastName", query = "SELECT a FROM Admin a WHERE a.lastName = :lastName"),
    @NamedQuery(name = "Admin.findByRegDate", query = "SELECT a FROM Admin a WHERE a.regDate = :regDate")})
public class Admin implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Size(max = 45)
    @Column(name = "user_name", length = 45)
    private String userName;
    @Size(max = 45)
    @Column(name = "password", length = 45)
    private String password;
    @Column(name = "role")
    private Short role;
    @Size(max = 45)
    @Column(name = "first_name", length = 45)
    private String firstName;
    @Size(max = 45)
    @Column(name = "last_name", length = 45)
    private String lastName;
    @Column(name = "reg_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date regDate;

    public Admin() {
    }

    public Admin(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Short getRole() {
        return role;
    }

    public void setRole(Short role) {
        this.role = role;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Admin)) {
            return false;
        }
        Admin other = (Admin) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Admin[ id=" + id + " ]";
    }
    
}
