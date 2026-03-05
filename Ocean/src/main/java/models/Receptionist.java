

package models;

public class Receptionist {
    private String firstName, lastName, email, contact, address, username, password;

    // Default Constructor
    public Receptionist() {}

    // Constructor to quickly wrap data
    public Receptionist(String firstName, String lastName, String email, String contact, String address, String username, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.contact = contact;
        this.address = address;
        this.username = username;
        this.password = password;
    }

    // Getters and Setters
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getEmail() { return email; }
    public String getContact() { return contact; }
    public String getAddress() { return address; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
}