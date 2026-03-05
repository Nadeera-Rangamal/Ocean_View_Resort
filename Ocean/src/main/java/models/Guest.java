package models;

public class Guest {

    private String guestName;
    private String email;
    private String idNumber;
    private String address;
    private String contact;
    private String reservationDate;
    private String reservationTime;

    public Guest() {}

    public Guest(String guestName, String email, String idNumber,
                 String address, String contact,
                 String reservationDate, String reservationTime) {
        this.guestName = guestName;
        this.email = email;
        this.idNumber = idNumber;
        this.address = address;
        this.contact = contact;
        this.reservationDate = reservationDate;
        this.reservationTime = reservationTime;
    }

    public String getGuestName() { return guestName; }
    public String getEmail() { return email; }
    public String getIdNumber() { return idNumber; }
    public String getAddress() { return address; }
    public String getContact() { return contact; }
    public String getReservationDate() { return reservationDate; }
    public String getReservationTime() { return reservationTime; }
}
