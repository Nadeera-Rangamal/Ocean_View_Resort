package models;

import java.sql.Date;

public class Booking {
    private String reservationNo;
    private String guestName;
    private String email;
    private String contact;
    private String roomNo;
    private Date checkIn;
    private Date checkOut;
    private String address;
    private String idNumber;

    public Booking() {}

    public Booking(String reservationNo, String guestName, String email,
                   String contact, String roomNo, Date checkIn,
                   Date checkOut, String address, String idNumber) {
        this.reservationNo = reservationNo;
        this.guestName = guestName;
        this.email = email;
        this.contact = contact;
        this.roomNo = roomNo;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.address = address;
        this.idNumber = idNumber;
    }

    // Getters
    public String getReservationNo() { return reservationNo; }
    public String getGuestName() { return guestName; }
    public String getEmail() { return email; }
    public String getContact() { return contact; }
    public String getRoomNo() { return roomNo; }
    public Date getCheckIn() { return checkIn; }
    public Date getCheckOut() { return checkOut; }
    public String getAddress() { return address; }
    public String getIdNumber() { return idNumber; }
}